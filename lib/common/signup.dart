import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../shadecn/_ui.dart';
import '../size.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<ShadFormState> _formKey = GlobalKey<ShadFormState>();
  final roles = {
    'farmer': 'Farmer',
    'consumer': 'Consumer',
  };

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
                    padding: EdgeInsets.only(left: w(70, context)),
                    child: const Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: h(75, context),
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
                        return 'Password is required.';
                      }
                      if (v.length < 8) {
                        return 'Password must be at least 8 characters.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: h(16, context)),
                  ShadInputFormField(
                    id: 'email',
                    label: const Text('Email'),
                    placeholder: const Text('Enter your email'),
                    validator: (v) {
                      if (v.isEmpty) {
                        return 'Email is required.';
                      }
                      if (v.length < 10) {
                        return 'Email must be at least 10 characters.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: h(16, context)),
                  ShadInputFormField(
                    id: 'phone',
                    label: const Text('Phone Number'),
                    placeholder: const Text('Enter your phone number'),
                    validator: (v) {
                      if (v.isEmpty) {
                        return 'Phone Number is required.';
                      }
                      if (v.length < 10) {
                        return 'Phone Number must be at least 10 characters.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: h(16, context)),
                  ShadSelect<String>(
                    placeholder: const Text('Select a role'),
                    options: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
                        child: Text(
                          'Roles',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      ...roles.entries
                          .map((e) =>
                              ShadOption(value: e.key, child: Text(e.value)))
                          .toList(),
                    ],
                    selectedOptionBuilder: (context, value) =>
                        Text(roles[value]!),
                  ),
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
