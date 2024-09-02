import 'package:argeazy/shadecn/_ui.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../size.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  String userType = '';

  void getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUserType = prefs.getString('user_type');
    setState(() {
      userType = storedUserType ?? 'None';
    });
  }

  @override
  void initState() {
    super.initState();
    getUserType();
  }

  @override
  Widget build(BuildContext context) {
    return ShadTheme(
      data: ShadThemeData(
          colorScheme: ShadColorScheme.lerp(startScheme, endScheme, 0.5),
          brightness: Brightness.dark),
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.only(top: h(10, context)),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: w(30, context),
                      ),
                      const Icon(Icons.language_outlined),
                      SizedBox(
                        width: w(240, context),
                      ),
                      const Icon(Icons.search),
                      SizedBox(
                        width: w(20, context),
                      ),
                      const Icon(Icons.message_outlined),
                    ],
                  ),
                  Text(userType),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}