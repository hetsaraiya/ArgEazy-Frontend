import 'dart:async';
import 'package:argeazy/shadecn/_ui.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../theme/theme.dart';
import 'widget/animation.dart';
import 'widget/splash.dart';
import 'package:flutter/material.dart';
import '../size.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentPage = 0;
  late PageController _pageController;
  Timer? _timer;

  List<Map<String, String>> splashData = [
    {
      "text": "As a customer, you can",
      "body":
          """Order healthy fresh farm produce \nfrom vasrieties on our app.""",
      "image": "assets/svgs/cucumber.jpg",
    },
    {
      "text": "As a farmer, you can",
      "body": """Upload your farm produce and \nget orders from customers.""",
      "image": "assets/svgs/palm.jpg"
    },
    {
      "text": "Diagnose your plant health",
      "body": """Diagnose you plant health \nand get treatment suggestions.""",
      "image": "assets/images/diagnose.jpeg"
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      if (currentPage < splashData.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShadTheme(
      data: ShadThemeData(colorScheme: ShadColorScheme.lerp( startScheme , endScheme, 0.5), brightness: Brightness.dark),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: h(88, context),
                  right: w(24, context),
                  left: w(24, context)),
              child: Container(
                height: h(516, context),
                width: w(327, context),
                decoration: const BoxDecoration(
                    color: Constants.black,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        itemCount: splashData.length,
                        itemBuilder: (context, index) => SplashContent(
                          image: splashData[index]["image"],
                          text: splashData[index]['text'],
                          body: splashData[index]['body'],
                          index: index,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: h(20, context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(context, currentPage, index: index),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: h(25, context)),
            ShadButton.outline(
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
              child: const Text("Sign In", style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: h(25, context)),
            ShadButton.outline(
              onPressed: () {},
              child: const Text("Sign Up", style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
