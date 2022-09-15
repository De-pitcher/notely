import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notely/screens/create_accoint_page.dart';
import 'package:notely/screens/create_first_note_page.dart';
import 'package:notely/screens/premium_page.dart';
import 'package:notely/screens/profile_page.dart';
import 'package:notely/screens/recent_notes_page.dart';
import 'package:notely/screens/welcome_page.dart';
import 'package:notely/utils/app_theme_notifier.dart';
import 'package:notely/utils/shared_utility.dart';
import 'package:notely/utils/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        ref.watch(isDarkModeProvider);
        final isDarkModEnabled =
            ref.watch(sharedUtitltyProvider).isDarkModeEnabled();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              AppTheme.getAppThemeData(isDarkModEnabled),
          initialRoute: WelcomePage.id,
          routes: {
            WelcomePage.id: ((context) => WelcomePage()),
            CreateAccountPage.id: ((context) => const CreateAccountPage()),
            PremiumPage.id: ((context) => const PremiumPage()),
            CreateFirstNotePage.id: ((context) => const CreateFirstNotePage()),
            RecentNotesPage.id: ((context) => const RecentNotesPage()),
            ProfilePage.id: ((context) => const ProfilePage()),
          },
          home: WelcomePage(),
        );
      },
    );
  }
}
