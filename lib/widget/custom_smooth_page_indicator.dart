import 'package:flutter/material.dart';
import 'package:notely/utils/util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      onDotClicked: (index) => controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ),
      controller: controller,
      count: 3,
      effect: WormEffect(
        spacing: 4,
        dotHeight: 10,
        dotWidth: 10,
        dotColor: AppTheme.darkOrangeColor.withOpacity(0.5),
        activeDotColor: AppTheme.darkOrangeColor,
      ),
    );
  }
}
