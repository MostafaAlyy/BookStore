part of 'book_cubit.dart';

@immutable
sealed class BookState {}

final class BookInitial extends BookState {}

final class GetHomeBookSuccessState extends BookState {}

final class GetHomeBookErrorState extends BookState {}
