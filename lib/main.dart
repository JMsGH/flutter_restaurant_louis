import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'decision_tree.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: SystemUI(),
    );
  }
}

class SystemUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: DecisionTree(),
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.blue,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }
}
