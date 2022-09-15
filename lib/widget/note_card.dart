import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notely/utils/util.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc,WidgetRef ref) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: ref.watch(isDarkModeProvider) ? AppTheme.whiteColor : AppTheme.orangeColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          doc[notelyTitle],
          style: AppTheme.boldTextStyle,
        ),
        Text(
          doc[notelyContent],
          style: AppTheme.textStyle2,
        ),
      ]),
    ),
  );
}
