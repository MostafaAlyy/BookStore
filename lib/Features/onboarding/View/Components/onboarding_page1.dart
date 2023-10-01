import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:book_store/Core/ColorHelper.dart';

PageModel onBoardingPage1() {
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
                'assets/Images/books.png',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                'Enjoy reading offline ',
                style: pageTitleStyle,
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Text(
                'Read books when you are not connected to internet \n You can download them in your device',
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
