import 'package:book_store/Features/HomeScreen/VieewModel/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class HomeSliderCard extends StatelessWidget {
  const HomeSliderCard({
    super.key,
    required this.img,
  });
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(12)),
      child: Image.network(
        img,
        fit: BoxFit.fill,
      ),
    );
  }
}
