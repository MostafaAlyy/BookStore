part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class GetCartBooksLoadingState extends CartState {}

final class GetCartBooksSuccessState extends CartState {}

final class GetCartBooksErrorState extends CartState {}

final class AddCartBooksSuccessState extends CartState {}

final class AddCartBooksErrorState extends CartState {}

final class RemoveCartBooksSuccessState extends CartState {}

final class RemoveCartBooksErrorState extends CartState {}

final class UpdateCartBooksSuccessState extends CartState {}

final class UpdateCartBooksErrorState extends CartState {}

final class PlaceOrderSuccessState extends CartState {
  final String message;
  PlaceOrderSuccessState({required this.message});
}

final class PlaceOrderErrorState extends CartState {}

final class InitGovernorateState extends CartState {}
