import 'package:book_store/Core/ColorHelper.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

PageModel onBoardingPage2() {
  return PageModel(
    widget: DecoratedBox(
      decoration: BoxDecoration(
        color: ColorHelper.mainColor,
        border: Border.all(
          width: 0.0,
          color: ColorHelper.mainColor,
        ),
      ),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45.0,
                vertical: 90.0,
              ),
              child: Image.asset(
                'assets/Images/bookSearch.png',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                'Search and purchase',
                style: pageTitleStyle,
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Text(
                'Quickly and easily  \n Find the book you need',
                style: pageInfoStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
