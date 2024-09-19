import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'common/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/login.dart';
import 'common/signup.dart';
import 'common/welcome.dart';
import 'common/home.dart';
import 'farmer/pending.verification.dart';
import 'package:argeazy/farmer/verification.dart';
import 'package:flutter/material.dart';
import 'consumer/verification.dart';
import 'theme/theme.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

final shorebirdCodePush = ShorebirdCodePush();

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const ArgEazy());
}

class ArgEazy extends StatefulWidget {
  const ArgEazy({Key? key}) : super(key: key);

  @override
  State<ArgEazy> createState() => _ArgEazyState();
}

class _ArgEazyState extends State<ArgEazy> {
  @override
  void initState() {
    super.initState();
    checkAccessToken();
    shorebirdCodePush
        .currentPatchNumber()
        .then((value) => print('current patch number is $value'));
  }

  Future<void> checkAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token') ?? '';
    final userType = prefs.getString('user_type') ?? '';

    if (accessToken.isNotEmpty) {
      if (userType == 'farmer') {
        Navigator.pushReplacementNamed(context, '/farmer/home');
      } else if (userType == 'consumer') {
        Navigator.pushReplacementNamed(context, '/consumer/home');
      }
    } else {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MelodyFlow",
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/': (context) => const LandingPage(),
        '/login': (context) => const LogIn(),
        '/signup': (context) => const SignUp(),
        '/consumer/verification': (context) => const ConsumerVerification(),
        '/farmer/verification': (context) => const FarmerVerification(),
        '/farmer/verification/pending': (context) =>
            const PendingVerificationPage(),
        '/farmer/home': (context) => const HomePage(),
        '/consumer/home': (context) => const HomePage(),
      },
    );
  }
}
