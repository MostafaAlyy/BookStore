import 'package:book_store/Features/HomeScreen/VieewModel/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class HomeSliderCard extends StatelessWidget {
  const HomeSliderCard({
    super.key,
    required this.cupit,
    required this.index,
  });

  final HomeCubit cupit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(12)),
      child: Image.network(
        cupit.homeSliderImages[index],
        fit: BoxFit.fill,
      ),
    );
  }
}
