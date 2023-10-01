import 'package:book_store/Core/ColorHelper.dart';
import 'package:book_store/Features/HomeScreen/VieewModel/cubit/home_cubit.dart';
import 'package:book_store/Features/HomeScreen/View/Components/Drawer.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cupit = HomeCubit.get(context);
        return AdvancedDrawer(
          drawer: const CustomDrawer(),
          backdrop: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorHelper.mainColor,
                  ColorHelper.mainColor.withOpacity(0.2)
                ],
              ),
            ),
          ),
          controller: cupit.advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          disabledGestures: false,
          childDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Scaffold(
            extendBody: true,
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: cupit.pageController,
              children: cupit.homePages,
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingNavbar(
                backgroundColor: ColorHelper.mainColor,
                selectedItemColor: ColorHelper.mainColor,
                onTap: (int val) {
                  cupit.changePage(val);
                },
                currentIndex: cupit.selectedPageIndex,
                items: [
                  FloatingNavbarItem(icon: Icons.home, title: 'Home'),
                  FloatingNavbarItem(icon: Icons.book, title: 'Books'),
                  FloatingNavbarItem(icon: Icons.favorite, title: 'Favorite'),
                  FloatingNavbarItem(icon: Icons.shopping_cart, title: 'Cart'),
                  FloatingNavbarItem(icon: Icons.person, title: 'Profile'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
