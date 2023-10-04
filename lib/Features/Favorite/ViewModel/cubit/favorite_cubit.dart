import 'package:book_store/Core/Database/remote/DioHelper/dio_helper.dart';
import 'package:book_store/Core/Database/remote/DioHelper/end_points.dart';
import 'package:book_store/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:book_store/Features/BookScreen/Model/product_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  static FavoriteCubit get(BuildContext context) => BlocProvider.of(context);

  List<BookModel> favoriteBooks = [];
  static Map<String, bool> isFavorite = {};
  void getFavoriteBooks() {
    if (LoginCubit.userData.token != null) {
      if (favoriteBooks.isEmpty) {
        favoriteBooks = [];
        DioHelper.getData(
                url: getFavoriteBooksEndPoint, token: LoginCubit.userData.token)
            .then((value) {
          for (var element in value.data['data']['data']) {
            BookModel tempBook = BookModel.fromJson(element);
            favoriteBooks.add(tempBook);
            isFavorite[tempBook.name!] = true;
          }
          emit(GetFavoriteBooksSuccessState());
        }).catchError((onError) {
          emit(GetFavoriteBooksErrorState());
          if (onError is DioException) {
            debugPrint(onError.response!.data.toString());
          }
        });
      }
    }
  }

  void addToFavorite({required BookModel book}) {
    DioHelper.postData(
            url: addFavoriteBooksEndPoint,
            data: {'product_id': book.id},
            token: LoginCubit.userData.token)
        .then((value) {
      favoriteBooks.add(book);
      isFavorite[book.name!] = true;
      emit(AddFavoriteBooksSuccessState());
    }).catchError((onError) {
      emit(AddFavoriteBooksErrorState());
    });
  }

  void removeToFavorite({required BookModel book}) {
    DioHelper.postData(
            url: removeFavoriteBooksEndPoint,
            data: {'product_id': book.id},
            token: LoginCubit.userData.token)
        .then((value) {
      favoriteBooks.remove(book);
      isFavorite[book.name!] = false;
      emit(RemoveFavoriteBooksSuccessState());
    }).catchError((onError) {
      emit(RemoveFavoriteBooksErrorState());
    });
  }
}
