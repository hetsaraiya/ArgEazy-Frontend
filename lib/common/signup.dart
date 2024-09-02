import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../shadecn/_ui.dart';
import '../size.dart';
import 'helpers/auth.dart';

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

  String? _selectedRole;

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
            child: SingleChildScrollView(
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
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: h(75, context)),
                      ShadInputFormField(
                        id: 'username',
                        label: Text('Username'),
                        cursorColor: Colors.white,
                        showCursor: true,
                        placeholder: Text('Enter your username'),
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
                        label: Text('Password'),
                        cursorColor: Colors.white,
                        showCursor: true,
                        placeholder: Text('Enter your password'),
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
                        cursorColor: Colors.white,
                        showCursor: true,
                        label: Text('Email'),
                        placeholder: Text('Enter your email'),
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
                        cursorColor: Colors.white,
                        showCursor: true,
                        label: Text('Phone Number'),
                        placeholder: Text('Enter your phone number'),
                        keyboardType: TextInputType.phone,
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
                        options: roles.entries
                            .map((e) =>
                                ShadOption(value: e.key, child: Text(e.value)))
                            .toList(),
                        selectedOptionBuilder: (context, value) =>
                            Text(roles[value]!),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedRole = newValue;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: w(130, context), top: h(20, context)),
                        child: ShadButton(
                          child: const Text('Sign Up'),
                          onPressed: () async {
                            print("Pressed");
                            if (validateForm(_formKey)) {
                              final formData = _formKey.currentState!.value;
                              final String username =
                                  formData['username'] ?? '';
                              final String password =
                                  formData['password'] ?? '';
                              final String email = formData['email'] ?? '';
                              final String phone = formData['phone'] ?? '';
                              final String role = _selectedRole ??
                                  ''; // Use selected role from state

                              // Validate role before proceeding
                              if (username.isEmpty ||
                                  password.isEmpty ||
                                  email.isEmpty ||
                                  phone.isEmpty ||
                                  role.isEmpty) {
                                print('All fields are required.');
                                return;
                              }

                              signup(context, username, password, email, phone,
                                  role);
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
        ),
      ),
    );
  }
}
