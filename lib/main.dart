import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './SignUp.dart';
import 'package:get/get.dart';
import './New_Form.dart';
import './Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Login_Page(),
      debugShowCheckedModeBanner: false,
    );
  }
}
