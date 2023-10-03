import 'package:book_store/Core/ColorHelper.dart';
import 'package:book_store/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:book_store/Features/HomeScreen/View/Pages/HomePage.dart';
import 'package:book_store/Features/onboarding/View/Pages/onboarding.dart';
import 'package:flutter/material.dart';

import '../../Core/Database/local_database/shared_preferences.dart';
import '../Auth/View/Pages/register.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        if (CacheData.getData(key: 'OnBoarding') == null) {
          CacheData.setData(key: 'OnBoarding', value: false);
        }
        if (CacheData.getData(key: 'OnBoarding') == false) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const OnBoarding(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => (LoginCubit.userData.token != null)
                    ? const HomePage()
                    : const RegisterPage(),
              ));
        }
      },
    );
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ColorHelper.mainColor,
        child: const Center(
            child: Text(
          'Book Store',
          style: TextStyle(color: Colors.white, fontSize: 36),
        )),
      ),
    );
  }
}
