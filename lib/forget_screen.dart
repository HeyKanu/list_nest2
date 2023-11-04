// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_nest2/SignUp.dart';
import 'package:list_nest2/Templets.dart';
import './Login.dart';

class Forget_password extends StatelessWidget {
  @override
  final _Forgot_password_key = GlobalKey<FormState>();
  var forgot_pass_con = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 1, 11, 20),
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 1, 11, 20),
            Color.fromARGB(255, 4, 31, 54),
          ],
          transform: GradientRotation(40),
          // stops: [0.5, 0],
        ),
      ),
      child: Center(
          child: SingleChildScrollView(
        child: Container(
          height: 550,
          width: 300,
          child: Form(
            key: _Forgot_password_key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Forgot ",
                  style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 50),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Plase enter the email address your'd like your Password reset information sent to  ",
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: TextFormField(
                    controller: forgot_pass_con,
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return 'please enter your Email - Id';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 255, 0, 0),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 255, 0, 0),
                        ),
                      ),
                      labelText: "Email Id",
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(162, 255, 255, 255)),
                      prefixText: "  ",
                      hintText: "Enter Your Email Id",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(118, 255, 255, 255)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  // borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    var email_text = forgot_pass_con.text.trim();
                    if (_Forgot_password_key.currentState!.validate()) {
                      print("validated");
                      try {
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email_text)
                            .then((value) => {
                                  print("Email sent"),
                                  Get.off(Login_Page()),
                                });
                      } on FirebaseAuthException catch (e) {
                        print("Error : $e");
                      }
                    } else {
                      print("Not validate");
                    }

                    print("object");
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                      "Sand request",
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                ),
              ],
            ),
          ),
          // color: Colors.white,
        ),
      )),
    ));
  }
}
