import 'package:flutter/material.dart';
import 'package:rusume_builder/local_db/resume_localdb.dart';

import 'home.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await resumeLocalDb.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Resume Builder Application',
     
      home: HomePage(),
    );
  }
}

