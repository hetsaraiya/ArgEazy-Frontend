import 'package:shorebird_code_push/shorebird_code_push.dart';

final shorebirdCodePush = ShorebirdCodePush();

Future<void> _checkForUpdates() async {
  final isUpdateAvailable =
      await shorebirdCodePush.isNewPatchAvailableForDownload();

  if (isUpdateAvailable) {
    await shorebirdCodePush.downloadUpdateIfAvailable();
  }
}
