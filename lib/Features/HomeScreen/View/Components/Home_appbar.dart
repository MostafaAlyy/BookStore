import 'package:book_store/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:book_store/Features/HomeScreen/VieewModel/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.cupit,
  });

  final HomeCubit cupit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              alignment: Alignment.topLeft,
              onPressed: () {
                cupit.advancedDrawerController.showDrawer();
              },
              icon: const Icon(Icons.sort_outlined)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hi, ${LoginCubit.userData.user!.name} ',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Text(
                'What are you want to read Today ?',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.height * 0.06,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(200)),
            child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(LoginCubit.userData.user!.image!)),
          )
        ],
      ),
    );
  }
}
