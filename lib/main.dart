import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vote_ease/firebase_options.dart';
import 'package:vote_ease/screens/login_page.dart';
import 'package:vote_ease/screens/signup_page.dart';
import 'screens/welcome_page.dart';
import 'screens/voting_screen.dart';
import 'screens/result_screen.dart';
import 'screens/profile_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Voting App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthenticationScreen(),
        '/voting': (context) =>  VotingScreen(),
        '/results': (context) => const ResultScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
      },
    );
  }
}
