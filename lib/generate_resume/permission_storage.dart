import 'package:permission_handler/permission_handler.dart';

Future<bool> storagePermission() async {
  bool havePermission = false;
  await Permission.storage.request();
  if (await Permission.storage.request().isGranted) {
    havePermission = true;
  } else if (await Permission.storage.isPermanentlyDenied ||
      await Permission.storage.isRestricted ||
      await Permission.storage.isDenied) {
    openAppSettings();
    await Permission.storage.request();
    if (await Permission.storage.isGranted) {
      havePermission = true;
    } else {
      havePermission = false;
    }
  } else {
    havePermission = false;
  }

  return havePermission;
}

const String directoryPath = "/storage/emulated/0/Download/resumeBuilder";