import 'package:argeazy/common/login.dart';
import 'package:argeazy/common/welcome.dart';
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
        '/' : (context) => const LandingPage(),
        '/login' : (context) => const LogIn(),
      },
    );
  }
}
