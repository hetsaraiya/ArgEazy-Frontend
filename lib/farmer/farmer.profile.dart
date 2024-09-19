import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../shadecn/_ui.dart';
import '../size.dart';

class FarmerProfile extends StatefulWidget {
  const FarmerProfile({super.key});

  @override
  State<FarmerProfile> createState() => _FarmerProfileState();
}

class _FarmerProfileState extends State<FarmerProfile> {
  bool _isEditing = false;
  TextEditingController _controller = TextEditingController(text: 'John Doe');

  @override
  Widget build(BuildContext context) {
    return ShadTheme(
      data: ShadThemeData(
          colorScheme: ShadColorScheme.lerp(startScheme, endScheme, 0.5),
          brightness: Brightness.dark),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(height: h(100, context)),
              const Center(
                child: ShadAvatar(
                  'https://app.requestly.io/delay/2000/avatars.githubusercontent.com/u/124599?v=4',
                  placeholder: Text('CN'),
                  size: Size(150, 150),
                ),
              ),
              SizedBox(height: h(20, context)),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _isEditing
                        ? IntrinsicWidth(
                            child: TextField(
                              controller: _controller,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                              onSubmitted: (value) {
                                setState(() {
                                  _isEditing = false;
                                });
                              },
                            ),
                          )
                        : Text(
                            _controller.text,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                    SizedBox(width: w(10, context)),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isEditing = !_isEditing;
                        });
                      },
                      icon: Icon(_isEditing ? Icons.check : Icons.edit),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
