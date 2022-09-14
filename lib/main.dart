import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notely/screens/create_accoint_page.dart';
import 'package:notely/screens/create_first_note_page.dart';
import 'package:notely/screens/edit_note_page.dart';
import 'package:notely/screens/premium_page.dart';
import 'package:notely/screens/profile_page.dart';
import 'package:notely/screens/recent_notes_page.dart';
import 'package:notely/screens/welcome_page.dart';
import 'package:notely/utils/util.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppTheme.scaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppTheme.scaffoldBackgroundColor,
          elevation: 0,
        ),
      ),
      initialRoute: WelcomePage.id,
      routes: {
        WelcomePage.id: ((context) =>  WelcomePage()),
        CreateAccountPage.id: ((context) =>  const CreateAccountPage()),
        PremiumPage.id: ((context) => const PremiumPage()),
        CreateFirstNotePage.id: ((context) =>  const CreateFirstNotePage()),
        RecentNotesPage.id: ((context) =>  const RecentNotesPage()),
        ProfilePage.id: ((context) =>  const ProfilePage()),
      },
      home: WelcomePage(),
    );
  }
}
