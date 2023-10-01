// ignore_for_file: use_key_in_widget_constructors

import 'package:book_store/Core/Database/local_database/shared_preferences.dart';
import 'package:book_store/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:book_store/Features/HomeScreen/VieewModel/cubit/home_cubit.dart';
import 'package:book_store/Features/Splash%20Screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'Core/Database/remote/DioHelper/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheInitialization();
  await DioHelper.init();

  await const FlutterSecureStorage().read(key: 'token').then((value) {
    if (value != null) {
      LoginCubit.userData.token = value;
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
          create: (BuildContext context) => HomeCubit()..getHomeSliderImages(),
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
