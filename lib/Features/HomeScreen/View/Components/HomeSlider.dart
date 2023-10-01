import 'package:book_store/Features/HomeScreen/VieewModel/cubit/home_cubit.dart';
import 'package:book_store/Features/HomeScreen/View/Components/home_slider_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({
    super.key,
    required this.cupit,
  });

  final HomeCubit cupit;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: cupit.homeSliderImages.length,
        itemBuilder: (context, index, realIndex) => HomeSliderCard(
              cupit: cupit,
              index: index,
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
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ));
  }
}
