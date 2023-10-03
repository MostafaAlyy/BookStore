import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:book_store/Core/Database/remote/DioHelper/dio_helper.dart';
import 'package:book_store/Core/Database/remote/DioHelper/end_points.dart';
import 'package:book_store/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  void updateProfileData({
    required String name,
    required String address,
    required String city,
    required String phone,
  }) {
    DioHelper.postData(
        url: updateProfileEndPoint,
        token: LoginCubit.userData.token,
        data: {
          'name': name,
          'address': address,
          'city': city,
          'phone': phone,
        }).then((value) {
      LoginCubit.userData.user!.name = name;
      LoginCubit.userData.user!.address = address;
      LoginCubit.userData.user!.city = city;
      LoginCubit.userData.user!.phone = phone;
      String userDataString = json.encode((LoginCubit.userData.toJson()));
      const FlutterSecureStorage()
          .write(key: 'userData', value: json.encode((userDataString)));
      emit(UpdateProfileDateSuccessState());
    }).catchError((onError) {
      emit(UpdateProfileDateErrorState());
      debugPrint(onError.toString());
      if (onError is DioException) {
        debugPrint(onError.response!.data['message']);
      }
    });
  }
}
