import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:notely/screens/create_accoint_page.dart';
import 'package:notely/utils/util.dart';
import 'package:notely/widget/custom_buttom.dart';
import 'package:notely/widget/custom_smooth_page_indicator.dart';

class WelcomePage extends StatelessWidget {
  static const id = 'welcome';
  WelcomePage({super.key});
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.titleAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Group 82 1.png'),
            const SizedBox(height: 20),
            SizedBox(
              width: 307,
              child: Column(
                children: [
                  Text(
                    'World\'s Safest And Largest Digital NoteBook',
                    textAlign: TextAlign.center,
                    style:AppTheme.headingTextStyle,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Notely is the world\'s safest, largest and  intelligent digital notebook. Join over 10M+ users already using Notely',
                    style: AppTheme.textStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  CustomSmoothPageIndicator(controller: controller),
                  const SizedBox(height: 60),
                  CustomButton(
                    text: 'GET STARTED',
                    onPressed: () =>
                        Navigator.pushNamed(context, CreateAccountPage.id),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: 'Already have an account?',
                      style: AppTheme.orangeTextStyle,
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
