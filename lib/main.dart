import 'common/login.dart';
import 'common/signup.dart';
import 'common/welcome.dart';
import 'common/home.dart';
import 'farmer/pending.verification.dart';
import 'package:argeazy/farmer/verification.dart';
import 'package:flutter/material.dart';
import 'theme/theme.dart';

void main() {
  runApp(const ArgEazy());
}

class ArgEazy extends StatefulWidget {
  const ArgEazy({super.key});

  @override
  State<ArgEazy> createState() => _ArgEazyState();
}

class _ArgEazyState extends State<ArgEazy> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MelodyFlow",
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/login': (context) => const LogIn(),
        '/signup': (context) => const SignUp(),
        // '/consumer/verification': (context) => const ConsumerVerification(),
        '/farmer/verification': (context) => const FarmerVerification(),
        '/farmer/verification/pending': (context) => const PendingVerificationPage(),
        '/farmer/home': (context) => const HomePage(),
        '/consumer/home': (context) => const HomePage(),
      },
    );
  }
}