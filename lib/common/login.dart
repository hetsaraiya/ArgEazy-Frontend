import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../shadecn/_ui.dart';
import '../size.dart';
import 'helpers/auth.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<ShadFormState> _formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ShadTheme(
        data: ShadThemeData(
            colorScheme: ShadColorScheme.lerp(startScheme, endScheme, 0.5),
            brightness: Brightness.dark),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Center(
            child: ShadForm(
              key: _formKey,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 350),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: w(130, context)),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: h(150, context)),
                    ShadInputFormField(
                      id: 'username',
                      label: const Text('Username'),
                      placeholder: const Text('Enter your username'),
                      validator: (v) {
                        if (v.isEmpty) {
                          return 'Username is required.';
                        }
                        if (v.length < 2) {
                          return 'Username must be at least 2 characters.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: h(16, context)),
                    ShadInputFormField(
                      id: 'password',
                      label: const Text('Password'),
                      placeholder: const Text('Enter your password'),
                      validator: (v) {
                        if (v.isEmpty) {
                          return 'Password is required.';
                        }
                        if (v.length < 8) {
                          return 'Password must be at least 8 characters.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: h(16, context)),
                    ShadButton(
                      child: const Text('Log In'),
                      onPressed: () async {
                        if (validateForm(_formKey)) {
                          if (validateForm(_formKey)) {
                            final formData = _formKey.currentState!.value;
                            final String username = formData['username'];
                            final String password = formData['password'];
                            login(context, username, password);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
