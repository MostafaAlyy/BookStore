import 'package:book_store/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:book_store/Features/HomeScreen/VieewModel/cubit/home_cubit.dart';
import 'package:book_store/Features/HomeScreen/View/Components/Home_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cupit = HomeCubit.get(context);
        return SafeArea(
          child: Column(
            children: [
              HomeAppBar(cupit: cupit),
              CarouselSlider.builder(
                  itemCount: cupit.homeSliderImages.length,
                  itemBuilder: (context, index, realIndex) => Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12)),
                        child: Image.network(
                          cupit.homeSliderImages[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.2,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ))
            ],
          ),
        );
      },
    );
  }
}
