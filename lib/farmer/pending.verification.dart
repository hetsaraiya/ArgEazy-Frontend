import '../size.dart';
import '../shadecn/_ui.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PendingVerificationPage extends StatelessWidget {
  const PendingVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadTheme(
      data: ShadThemeData(
          colorScheme: ShadColorScheme.lerp(startScheme, endScheme, 0.5),
          brightness: Brightness.dark),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.cancel,
                color: Colors.red,
                size: w(170, context),
              ),
              SizedBox(height: h(20, context)),
              const Text(
                'Your verification is still pending',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}