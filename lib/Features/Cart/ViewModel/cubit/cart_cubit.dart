import 'package:book_store/Core/ConstData.dart';
import 'package:book_store/Core/Database/remote/DioHelper/dio_helper.dart';
import 'package:book_store/Core/Database/remote/DioHelper/end_points.dart';
import 'package:book_store/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:book_store/Features/BookScreen/Model/product_model.dart';
import 'package:book_store/Features/Cart/Model/cart_book_model.dart';
import 'package:book_store/Features/Cart/Model/governerates_model.dart';
import 'package:book_store/Features/Profile/ViewModel/cubit/profile_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(BuildContext context) => BlocProvider.of(context);
  List<CartBook> cartBooks = [];
  dynamic total = "0";
  void getCartBooks() {
    if (LoginCubit.userData.token != null) {
      emit(GetCartBooksLoadingState());
      DioHelper.getData(
              url: getCartBooksEndPoint, token: LoginCubit.userData.token)
          .then((value) {
        for (var element in value.data['data']['cart_items']) {
          CartBook tempBook = CartBook.fromJson(element);
          cartBooks.add(tempBook);
        }
        total = value.data['data']['total'] ?? "0";
        emit(GetCartBooksSuccessState());
      }).catchError((onError) {
        emit(GetCartBooksErrorState());
        if (onError is DioException) {
          debugPrint(onError.response!.data.toString());
        }
      });
    }
  }

  void addToCart({required BookModel book}) {
    DioHelper.postData(
            url: addCartBooksEndPoint,
            data: {'product_id': book.id},
            token: LoginCubit.userData.token)
        .then((value) {
      cartBooks = [];
      for (var element in value.data['data']['cart_items']) {
        CartBook tempBook = CartBook.fromJson(element);
        cartBooks.add(tempBook);
      }
      total = value.data['data']['total'];
      emit(AddCartBooksSuccessState());
    }).catchError((onError) {
      emit(AddCartBooksErrorState());
      if (onError is DioException) {
        debugPrint(onError.response!.data.toString());
      }
    });
  }

  void removeFromCart({required CartBook book}) {
    DioHelper.postData(
            url: removeCartBooksEndPoint,
            data: {'cart_item_id': book.itemId},
            token: LoginCubit.userData.token)
        .then((value) {
      cartBooks = [];
      for (var element in value.data['data']['cart_items']) {
        CartBook tempBook = CartBook.fromJson(element);
        cartBooks.add(tempBook);
      }
      total = value.data['data']['total'];
      emit(RemoveCartBooksSuccessState());
    }).catchError((onError) {
      emit(RemoveCartBooksErrorState());
      if (onError is DioException) {
        debugPrint(onError.response!.data.toString());
      }
    });
  }

  void updateFromCart({required CartBook book, required int val}) {
    DioHelper.postData(
            url: updateCartBooksEndPoint,
            data: {'cart_item_id': book.itemId, 'quantity': val},
            token: LoginCubit.userData.token)
        .then((value) {
      cartBooks = [];
      for (var element in value.data['data']['cart_items']) {
        CartBook tempBook = CartBook.fromJson(element);
        cartBooks.add(tempBook);
      }
      total = value.data['data']['total'];
      emit(UpdateCartBooksSuccessState());
    }).catchError((onError) {
      emit(UpdateCartBooksErrorState());
      if (onError is DioException) {
        debugPrint(onError.response!.data.toString());
      }
    });
  }

  void placeOrder({
    required String name,
    required String governorateId,
    required String phone,
    required String address,
    required String email,
  }) {
    DioHelper.postData(
        url: placeOrderEndPoint,
        token: LoginCubit.userData.token,
        data: {
          'name': name,
          'governorate_id': governorateId,
          'phone': phone,
          'address': address,
          'email': email,
        }).then((value) {
      cartBooks.clear();
      emit(PlaceOrderSuccessState(message: value.data['message']));
    }).catchError((onError) {
      emit(PlaceOrderErrorState());
    });
  }

  List<Governorate> governesses = [];
  void initGovernorate() {
    for (var element in allGovernratesData) {
      governesses.add(Governorate.fromJson(element));
    }
    emit(InitGovernorateState());
  }
}
