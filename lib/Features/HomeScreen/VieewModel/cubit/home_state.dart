part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ChangePageState extends HomeState {}

final class GetHomeSliderSuccessState extends HomeState {}

final class GetHomeSliderErrorState extends HomeState {}
