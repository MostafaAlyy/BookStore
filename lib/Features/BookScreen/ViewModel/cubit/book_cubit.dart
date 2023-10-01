import 'package:book_store/Core/Database/remote/DioHelper/dio_helper.dart';
import 'package:book_store/Core/Database/remote/DioHelper/end_points.dart';
import 'package:book_store/Features/BookScreen/Model/book_categorie.dart';
import 'package:book_store/Features/BookScreen/Model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());
  static BookCubit get(BuildContext context) => BlocProvider.of(context);
  List<BookModel> bestSellers = [];
  void getBestSellers() {
    bestSellers = [];
    DioHelper.getData(url: bestsellerBooksEndPoint).then((value) {
      for (var element in value.data['data']['products']) {
        bestSellers.add(BookModel.fromJson(element));
      }
      emit(GetHomeBookSuccessState());
    }).catchError((onError) {
      emit(GetHomeBookErrorState());
    });
  }

  List<BookModel> newArrivalBooks = [];
  void getNewArrivalBooks() {
    newArrivalBooks = [];
    DioHelper.getData(url: newArrivalBooksEndPoint).then((value) {
      for (var element in value.data['data']['products']) {
        newArrivalBooks.add(BookModel.fromJson(element));
      }
      emit(GetHomeBookSuccessState());
    }).catchError((onError) {
      emit(GetHomeBookErrorState());
    });
  }

  List<BookCategoric> categories = [];
  void getCategoriesBooks() {
    categories = [];
    DioHelper.getData(url: categoriesEndPoint).then((value) {
      for (var element in value.data['data']['categories']) {
        categories.add(BookCategoric.fromJson(element));
      }
      emit(GetHomeBookSuccessState());
    }).catchError((onError) {
      emit(GetHomeBookErrorState());
    });
  }

  List<BookModel> searchBooks = [];
  void searchGetBooks(String key) {
    searchBooks = [];
    DioHelper.getData(
        url: productsSearchEndPoint,
        queryParameters: {'name': key}).then((value) {
      for (var element in value.data['data']['products']) {
        searchBooks.add(BookModel.fromJson(element));
      }
      emit(GetHomeBookSuccessState());
    }).catchError((onError) {
      emit(GetHomeBookErrorState());
    });
  }
}
