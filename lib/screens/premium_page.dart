import 'package:flutter/material.dart';
import 'package:notely/screens/create_first_note_page.dart';
import 'package:notely/utils/util.dart';
import 'package:notely/widget/custom_buttom.dart';

class PremiumPage extends StatelessWidget {
  static const id = 'premiumPage';
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.customppBar('Notely Premium'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/Group 83 1.png'),
            Text(
              'Start Using Notely with Premium Benefits',
              textAlign: TextAlign.center,
              style: AppTheme.headingTextStyle,
            ),
            const SizedBox(height: 30),
            _checkText('Start Using Notely with Premium Benefits'),
            const SizedBox(height: 10),
            _checkText('Create unlimited projects and teams'),
            const SizedBox(height: 10),
            _checkText('Dialy backups to keep your data safe'),
            const SizedBox(height: 30),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _priceContainer('Annual', '79.99', 'year'),
                  const SizedBox(width: 20),
                  _priceContainer('Monthly', '79.99', 'month', false),
                ],
              ),
            ),
            const SizedBox(height: 40),
            CustomButton(
              text: 'SUSCRIBE',
              onPressed: () =>
                  Navigator.pushNamed(context, CreateFirstNotePage.id),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {},
              child: Text(
                'Restore Purchase',
                style: AppTheme.orangeTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _priceContainer(String type, String price, String percent,
      [bool? enableBorder]) {
    return Container(
      width: 147,
      height: 147,
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        border: enableBorder == null || enableBorder == true
            ? Border.all(color: AppTheme.orangeColor, width: 6)
            : null,
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            type,
            style: AppTheme.textStyle,
            textAlign: TextAlign.center,
          ),
          Text(
            '\$$price',
            style: AppTheme.titleTextStyle2,
            textAlign: TextAlign.center,
          ),
          Text(
            'per $percent',
            style: AppTheme.smallerBoldTextSTyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Row _checkText(String text) {
    return Row(
      children: [
        const Icon(
          Icons.check,
          color: AppTheme.checkColor,
          size: 12,
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            style: AppTheme.checkTextStyle,
          ),
        ),
      ],
    );
  }
}
