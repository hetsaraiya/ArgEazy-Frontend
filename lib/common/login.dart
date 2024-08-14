import '../../shadecn/_ui.dart';
import 'package:argeazy/size.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<ShadFormState> _formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    return ShadTheme(
      data: ShadThemeData(
          colorScheme: ShadColorScheme.lerp(startScheme, endScheme, 0.5),
          brightness: Brightness.dark),
      child: Scaffold(
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
                    padding: EdgeInsets.only(
                        left: w(70, context)),
                    child: const Text(
                      'Log In',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: h(150, context),
                  ),
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
                        return 'Username is required.';
                      }
                      if (v.length < 2) {
                        return 'Username must be at least 2 characters.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: h(16, context)),
                  Padding(
                    padding: EdgeInsets.only(
                        left: w(40, context), top: h(20, context)),
                    child: ShadButton(
                      child: const Text('Log In'),
                      onPressed: () {
                        final currentState = _formKey.currentState;
                        if (currentState == null) {
                          print('FormKey currentState is null.');
                        } else if (currentState.saveAndValidate()) {
                          print(
                              'Validation succeeded with ${currentState.value}');
                        } else {
                          print('Validation failed');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
