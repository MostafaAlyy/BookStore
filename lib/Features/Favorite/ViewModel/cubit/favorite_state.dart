part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class GetFavoriteBooksSuccessState extends FavoriteState {}

final class GetFavoriteBooksErrorState extends FavoriteState {}

final class AddFavoriteBooksSuccessState extends FavoriteState {}

final class AddFavoriteBooksErrorState extends FavoriteState {}

final class RemoveFavoriteBooksSuccessState extends FavoriteState {}

final class RemoveFavoriteBooksErrorState extends FavoriteState {}
