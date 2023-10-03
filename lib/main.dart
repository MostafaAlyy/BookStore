// ignore_for_file: use_key_in_widget_constructors

import 'dart:convert';

import 'package:book_store/Core/Database/local_database/shared_preferences.dart';
import 'package:book_store/Features/Auth/Models/user_moudel.dart';
import 'package:book_store/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:book_store/Features/BookScreen/ViewModel/cubit/book_cubit.dart';
import 'package:book_store/Features/HomeScreen/VieewModel/cubit/home_cubit.dart';
import 'package:book_store/Features/Profile/ViewModel/cubit/profile_cubit.dart';
import 'package:book_store/Features/Splash%20Screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'Core/Database/remote/DioHelper/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheInitialization();
  await DioHelper.init();
  String? userDataString;

  await const FlutterSecureStorage().read(key: 'userData').then((value) {
    if (value != null) {
      userDataString = json.decode(value);
    }
    if (userDataString != null) {
      LoginCubit.userData = UserModel.fromJson(json.decode(userDataString!));
    }
  });
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          lazy: false,
          create: (
            BuildContext context,
          ) =>
              HomeCubit()..getHomeSliderImages(),
        ),
        BlocProvider<BookCubit>(
          lazy: false,
          create: (
            BuildContext context,
          ) =>
              BookCubit()
                ..getBestSellers()
                ..getNewArrivalBooks()
                ..getCategoriesBooks(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Book Store',
        home: SplashScreen(),
      ),
    );
  }
}
