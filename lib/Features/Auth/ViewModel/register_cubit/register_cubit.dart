import 'package:book_store/Core/Database/remote/DioHelper/dio_helper.dart';
import 'package:book_store/Core/Database/remote/DioHelper/end_points.dart';
import 'package:book_store/Features/Auth/Models/user_moudel.dart';
import 'package:book_store/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(AuthInitial());
  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  void register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) {
    DioHelper.postData(url: registerEndpoint, data: {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    }).then((value) {
      LoginCubit.userData = UserModel.fromJson(value.data['data']);
      emit(RegisterSuccessState(value.data['message']));
      debugPrint(value.data['message']);
    }).catchError((onError) {
      emit(RegisterErrorState());
      if (onError is DioException) {
        debugPrint(onError.response.toString());
      }
    });
  }

  void verifyEmail(String otb) {
    DioHelper.postData(
        url: verifyEmailEndPoint,
        token: LoginCubit.userData.token,
        data: {'verify_code': otb}).then((value) {
      emit(VerifySuccessState(value.data['message']));
    }).catchError((onError) {
      emit(VerifyErrorState());
      if (onError is DioException) {
        debugPrint(onError.response.toString());
      }
    });
  }
}
