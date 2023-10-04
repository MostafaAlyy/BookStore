import 'package:book_store/Core/general_components/build_show_toast.dart';
import 'package:book_store/Features/Auth/Models/user_moudel.dart';
import 'package:book_store/Features/Auth/View/Pages/login.dart';
import 'package:book_store/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:book_store/Features/HomeScreen/VieewModel/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  LoginCubit.userData.user!.image!,
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.history),
                title: const Text('Order History'),
              ),
              ListTile(
                onTap: () {
                  HomeCubit.get(context).advancedDrawerController.hideDrawer();
                  HomeCubit.get(context).changePage(4);
                },
                leading: const Icon(Icons.edit),
                title: const Text('Edit Profile'),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.password_rounded),
                title: const Text('Change Password'),
              ),
              ListTile(
                onTap: () {
                  buildShowToast("LogOut Successfully");
                  const FlutterSecureStorage().delete(key: 'userData');
                  LoginCubit.userData = UserModel();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                      (route) => false);
                },
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
              ),
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: const Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
