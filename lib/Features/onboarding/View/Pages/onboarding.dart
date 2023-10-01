import 'package:book_store/Core/ColorHelper.dart';
import 'package:book_store/Features/Auth/View/Pages/register.dart';
import 'package:book_store/Features/onboarding/View/Components/onboarding_page%202.dart';
import 'package:book_store/Features/onboarding/View/Components/onboarding_page%203.dart';
import 'package:book_store/Features/onboarding/View/Components/onboarding_page1.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

import '../../../../Core/Database/local_database/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late Material materialButton;

  late int index;
  final onboardingPagesList = [
    onBoardingPage1(),
    onBoardingPage2(),
    onBoardingPage3(),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          CacheData.setData(key: 'OnBoarding', value: true);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterPage(),
            ),
            (route) => false,
          );
        },
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Sign up',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.mainColor,
      body: Onboarding(
        pages: onboardingPagesList,
        onPageChange: (int pageIndex) {
          index = pageIndex;
        },
        startPageIndex: 0,
        footerBuilder: (context, dragDistance, pagesLength, setIndex) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: ColorHelper.mainColor,
              border: Border.all(
                width: 0.0,
                color: ColorHelper.mainColor,
              ),
            ),
            child: ColoredBox(
              color: ColorHelper.mainColor,
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIndicator(
                      netDragPercent: dragDistance,
                      pagesLength: pagesLength,
                      indicator: Indicator(
                        indicatorDesign: IndicatorDesign.line(
                          lineDesign: LineDesign(
                            lineType: DesignType.line_uniform,
                          ),
                        ),
                      ),
                    ),
                    index == pagesLength - 1
                        ? _signupButton
                        : _skipButton(setIndex: setIndex)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
