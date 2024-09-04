import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'helper/upload.verification.dart';
import '../shadecn/_ui.dart';
import '../size.dart';

class ConsumerVerification extends StatefulWidget {
  const ConsumerVerification({Key? key}) : super(key: key);

  @override
  State<ConsumerVerification> createState() => _ConsumerVerificationState();
}

class _ConsumerVerificationState extends State<ConsumerVerification> {
  File? _aadharCard;
  File? _panCard;
  String _aadharCardName = '';
  String _panCardName = '';

  Future<void> _pickFile(String field) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        switch (field) {
          case 'aadhar':
            _aadharCard = File(result.files.single.path!);
            _aadharCardName = result.files.single.name;
            break;
          case 'pan':
            _panCard = File(result.files.single.path!);
            _panCardName = result.files.single.name;
            break;
        }
      });
      print('File selected for $field: ${result.files.single.name}');
    } else {
      print('No file selected for $field');
    }
  }

  void _clearFile(String field) {
    setState(() {
      switch (field) {
        case 'aadhar':
          _aadharCard = null;
          _aadharCardName = '';
          break;
        case 'pan':
          _panCard = null;
          _panCardName = '';
          break;
      }
    });
  }

  void _uploadFiles() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token') ?? '';

    if (_aadharCard != null && _panCard != null) {
      final result = await uploadFiles(_aadharCard!, _panCard!, accessToken);

      if (result['success']) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Files Uploaded Successfully!')),
        );
        Navigator.pushNamed(context, '/login');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Upload failed: ${result['error']}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShadTheme(
      data: ShadThemeData(
        colorScheme: ShadColorScheme.lerp(startScheme, endScheme, 0.5),
        brightness: Brightness.dark,
      ),
      child: SafeArea(
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
                          _buildFileField(
                              'Aadhar Card', _aadharCardName, 'aadhar'),
                          SizedBox(height: h(20, context)),
                          _buildFileField('PAN Card', _panCardName, 'pan'),
                          SizedBox(height: h(20, context)),
                          ShadButton.outline(
                            onPressed: (_aadharCard != null && _panCard != null)
                                ? _uploadFiles
                                : null,
                            child: const Text(
                              'Upload Files',
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

  Widget _buildFileField(String label, String fileName, String field) {
    return InkResponse(
      onTap:
          fileName.isEmpty ? () => _pickFile(field) : () => _clearFile(field),
      child: ShadInput(
        enabled: false,
        readOnly: true,
        placeholder:
            Text(fileName.isEmpty ? 'No file selected for $label' : fileName),
        suffix: fileName.isNotEmpty
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.clear, color: Colors.red),
                    onPressed: () => _clearFile(field),
                  ),
                ],
              )
            : const Icon(Icons.upload_file),
      ),
    );
  }
}
