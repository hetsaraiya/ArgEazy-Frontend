import 'package:argeazy/shadecn/_ui.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class FarmerVerification extends StatefulWidget {
  const FarmerVerification({super.key});

  @override
  State<FarmerVerification> createState() => _FarmerVerificationState();
}

class _FarmerVerificationState extends State<FarmerVerification> {
  File? _selectedFile;
  String _fileName = '';

  Future<void> _pickFile() async {
    print('Pick file triggered'); // Debug statement
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
        _fileName = result.files.single.name;
      });
      print('File selected: $_fileName'); // Debug statement
    } else {
      print('No file selected'); // Debug statement
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ShadTheme(
        data: ShadThemeData(
          colorScheme: ShadColorScheme.lerp(startScheme, endScheme, 0.5),
          brightness: Brightness.dark,
        ),
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Please Upload Your Verification Documents",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ShadCard(
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkResponse(
                            onTap: _pickFile,
                            child: ShadInput(
                                enabled: false,
                                readOnly: true,
                                placeholder: Text(_fileName.isEmpty
                                    ? 'No file selected'
                                    : _fileName),
                                suffix: const Icon(Icons.upload_file)),
                          ),
                          const SizedBox(height: 20),
                          ShadButton.outline(
                            onPressed: _selectedFile != null
                                ? () {
                                    // Handle file upload or further actions
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'File Uploaded Successfully!')),
                                    );
                                  }
                                : null,
                            child: const Text(
                              'Upload File',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
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
