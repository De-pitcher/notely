import 'package:flutter/material.dart';
import 'package:notely/utils/util.dart';

class Helper {
  static titleAppBar() {
    return AppBar(
      title: Center(
        child: Text(
          'NOTELY',
          textAlign: TextAlign.center,
          style: AppTheme.titleTextStyle,
        ),
      ),
    );
  }

  static customppBar(
    String titleText, [
    Widget? leading,
    Widget? trailing,
  ]) {
    return AppBar(
      leading: leading ?? Container(),
      title: Center(
        child: Text(
          titleText,
          textAlign: TextAlign.center,
          style: AppTheme.appBarTitleTextStyle,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: trailing ?? AppIcons.cancel_icon,
        )
      ],
    );
  }
}
