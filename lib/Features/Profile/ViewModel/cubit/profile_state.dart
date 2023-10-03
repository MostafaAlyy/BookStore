part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class UpdateProfileDateSuccessState extends ProfileState {}

final class UpdateProfileDateErrorState extends ProfileState {}
