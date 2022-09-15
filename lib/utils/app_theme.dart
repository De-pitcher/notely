import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const scaffoldBackgroundColor = Color(0xFFF8EEE2);
  static const darkThemeColor = Color(0xFF000633);
  static const headingTextColor = Color(0xFF403B36);
  static const textColor = Color(0xFF595550);
  static const darkOrangeColor = Color(0xFFD9614C);
  static const textFieldBorderColor = Color(0xFFF2E5D5);
  static const whiteColor = Color(0xFFFFFDFA);
  static const orangeColor = Color(0xFFF47F6B);
  static const iconColor = Color(0xFFD9614C);
  static const inputBorderColor = Color(0xFFF2E5D5);
  static const checkColor = Color(0xFF5A5266);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: orangeColor,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: scaffoldBackgroundColor,
        elevation: 0,
      ),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: orangeColor,
      scaffoldBackgroundColor: darkThemeColor,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: darkThemeColor,
        elevation: 0,
      ),
    );
  }

  static bool _isDarkTheme = false;

  static ThemeMode getAppThemeData(bool isDarkModeEnabled) {
    isDarkModeEnabled ? _isDarkTheme = true : _isDarkTheme = false;
    return isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light;
  }

  static TextStyle headingTextStyle = GoogleFonts.nunito(
    fontWeight: FontWeight.w900,
    fontSize: 24,
    color: !_isDarkTheme ? headingTextColor : whiteColor,
  );
  static TextStyle titleTextStyle = GoogleFonts.titanOne(
    fontWeight: FontWeight.w400,
    fontSize: 20,
    color: !_isDarkTheme ? headingTextColor : whiteColor,
  );
  static TextStyle titleTextStyle2 = GoogleFonts.nunito(
    fontWeight: FontWeight.w900,
    fontSize: 28,
    color: !_isDarkTheme ? headingTextColor : whiteColor,
  );
  static TextStyle smallerBoldTextSTyle = GoogleFonts.nunito(
    fontWeight: FontWeight.w800,
    fontSize: 14,
    color: checkColor,
  );

  static TextStyle appBarTitleTextStyle = GoogleFonts.titanOne(
    fontWeight: FontWeight.w900,
    fontSize: 14,
    color: !_isDarkTheme ? headingTextColor : whiteColor,
  );

  static TextStyle textStyle = GoogleFonts.nunito(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: !_isDarkTheme ? textColor : whiteColor,
  );

  static TextStyle textStyle2 = GoogleFonts.nunito(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: !_isDarkTheme ? textColor : whiteColor,
  );

  static TextStyle boldTextStyle = GoogleFonts.nunito(
    fontWeight: FontWeight.w900,
    fontSize: 16,
    color: !_isDarkTheme ? textColor : whiteColor,
  );

  static TextStyle checkTextStyle = GoogleFonts.nunito(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: checkColor,
  );

  static TextStyle smallerTextStyle = GoogleFonts.nunito(
    fontWeight: FontWeight.w700,
    fontSize: 12,
  );

  static TextStyle buttonTextStyle = GoogleFonts.nunito(
    fontWeight: FontWeight.w900,
    fontSize: 20,
    color: whiteColor,
  );

  static TextStyle orangeTextStyle = GoogleFonts.nunito(
    fontWeight: FontWeight.w800,
    fontSize: 16,
    color: darkOrangeColor,
  );

  static final buttonStyle = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
    minimumSize: MaterialStateProperty.all(const Size(50, 50)),
    backgroundColor: MaterialStateProperty.all(AppTheme.darkOrangeColor),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
  );

  static InputDecoration inputDecoration(String hintText) => InputDecoration(
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: AppTheme.inputBorderColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: AppTheme.inputBorderColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: const BorderSide(color: Colors.red, width: 2.0)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Colors.red, width: 2.0)),
      );
}

final appThemeProvider = Provider<AppTheme>((ref) {
  return AppTheme();
});
final isDarkModeProvider = StateProvider<bool>((ref) {
  return false;
});
