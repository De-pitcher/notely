// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notely/utils/util.dart';

class AppIcons {
  static final cancel_icon = SvgPicture.asset('assets/icons/Close.svg');

  static final filter_icon = Image.asset('assets/icons/align-left-1.png');

  static final search_icon = SvgPicture.asset('assets/icons/Search.svg');

  static final back_icon = Image.asset('assets/icons/Arrow left 1.png');

  static final forward_icon = Image.asset('assets/icons/Arrow right 1.png');
  static final more_icon = SvgPicture.asset('assets/icons/More ver..svg');

  static const premium_icon = Icon(Icons.person, color: AppTheme.iconColor);

  static const edit_icon = Icon(Icons.edit, color: AppTheme.iconColor);

  static final theme_icon = Image.asset('assets/icons/contrast.png');

  static final notification_icon =
      Image.asset('assets/icons/bell.png');

  static final security_icon = Image.asset('assets/icons/Exclude.png');

  static final logout_icon = Image.asset('assets/icons/logout.png');
}
