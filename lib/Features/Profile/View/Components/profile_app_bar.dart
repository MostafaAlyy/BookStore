import 'package:book_store/Core/ColorHelper.dart';
import 'package:book_store/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.32,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: const BoxDecoration(
                    color: ColorHelper.mainColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(120),
                        bottomRight: Radius.circular(120))),
                child: const Center(
                  child: Text(
                    'Profile\n',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 46,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.28,
          top: MediaQuery.of(context).size.height * 0.10,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.21,
            width: MediaQuery.of(context).size.height * 0.21,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.height * 0.2,
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(200)),
                child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(LoginCubit.userData.user!.image!)),
              ),
            ),
          ),
        ),
        Positioned(
            top: 30,
            right: 10,
            child: IconButton(
              onPressed: () {},
              iconSize: 30,
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            )),
      ],
    );
  }
}
