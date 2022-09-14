import 'package:flutter/material.dart';
import 'package:notely/utils/util.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const CustomButton({
    Key? key,
    required this.text, this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74,
      width: 319,
      child: OutlinedButton(
        onPressed: onPressed,
        style: AppTheme.buttonStyle,
        child: Text(
          text,
          style: AppTheme.buttonTextStyle,
        ),
      ),
    );
  }
}
