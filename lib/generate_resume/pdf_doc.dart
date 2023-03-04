

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:rusume_builder/generate_resume/permission_storage.dart';
import 'package:rusume_builder/local_db/resume_localdb.dart';


pdf_generate({required Uint8List screenshot}) async {
 
  final dir = Directory(directoryPath); 

  String fileNameForResume = resumeLocalDb.resumeName.isNotEmpty
      ? '${resumeLocalDb.resumeName}.jpeg'
      : 'resume.jpeg';

  bool status = await storagePermission();

  if (status) {
    if (await dir.exists()) {
      dir.path;
    } else {
      dir.create();
      dir.path;
    }
    File file = File('${dir.path}/$fileNameForResume');
    log('file : $file');
    log('dir : ${dir.path}');
    file.writeAsBytesSync(
      screenshot,
      mode: FileMode.append,
      flush: false,
    );

   
  }
}
