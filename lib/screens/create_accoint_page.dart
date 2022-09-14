import 'package:flutter/material.dart';
import 'package:notely/screens/premium_page.dart';
import 'package:notely/utils/util.dart';
import 'package:notely/widget/custom_buttom.dart';

class CreateAccountPage extends StatefulWidget {
  static const id = 'creatAccountPage';
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.titleAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SizedBox(
            width: 319,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Create a free account',
                      textAlign: TextAlign.center,
                      style: AppTheme.headingTextStyle,
                    ),
                    Text(
                      'Join Notel for free. Create and share unlimited with your friends',
                      style: AppTheme.textStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const CustomTextFieldWidget(
                  title: 'Full Name',
                  hintText: 'Salman Khan',
                ),
                const CustomTextFieldWidget(
                  title: 'Email Address',
                  hintText: 'mesalmanwap@gmail.com',
                ),
                const CustomTextFieldWidget(
                  title: 'Password',
                  hintText: '##########',
                ),
                const SizedBox(height: 60),
                CustomButton(
                  text: 'CREATE AN ACCOUNT',
                  onPressed: () => Navigator.pushNamed(context, PremiumPage.id),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Already have an account?',
                    style: AppTheme.orangeTextStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  final String title, hintText;
  const CustomTextFieldWidget({
    Key? key,
    required this.title,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.smallerTextStyle,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 319,
          height: 59,
          child: TextField(
              style: AppTheme.textStyle,
              decoration: AppTheme.inputDecoration(hintText)),
        ),
      ],
    );
  }
}
