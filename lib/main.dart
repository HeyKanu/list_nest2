import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:list_nest2/Templets.dart';
import './SignUp.dart';
import 'package:get/get.dart';
import './New_Form.dart';
import './Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Data_show.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  User? user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: user != null ? Templets_page() : Login_Page(),
      debugShowCheckedModeBanner: false,
    );
  }
}
