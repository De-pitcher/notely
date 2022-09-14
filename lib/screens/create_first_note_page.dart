import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:notely/screens/recent_notes_page.dart';
import 'package:notely/utils/util.dart';
import 'package:notely/widget/custom_buttom.dart';

class CreateFirstNotePage extends StatelessWidget {
  static const id = 'createFirstNote';
  const CreateFirstNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.customppBar(
        'All Notes',
        AppIcons.filter_icon,
        AppIcons.search_icon,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/Group 84 1.png'),
          ),
          const SizedBox(height: 40),
          Text(
            'Create Your First Note',
            textAlign: TextAlign.center,
            style: AppTheme.headingTextStyle,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 314,
            child: Text(
              'Add a note about anything (your thoughts on climate change, or your history essay) and share it with the world.',
              style: AppTheme.textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
          CustomButton(
            text: 'Create A Note',
            onPressed: () => Navigator.pushNamed(context, RecentNotesPage.id),
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              text: 'Import Notes',
              style: AppTheme.orangeTextStyle,
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          )
        ],
      ),
    );
  }
}
