import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_nest2/Login.dart';
import 'package:list_nest2/Templets.dart';
import './services.dart';

class Sign_Up_Page extends StatelessWidget {
  Sign_Up_Page({super.key});
  final _SingUp_key = GlobalKey<FormState>();
  var user_name_con = TextEditingController();
  var user_Email_con = TextEditingController();
  var user_phone_no_con = TextEditingController();
  var user_password_con = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 1, 11, 20),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(
          top: 0,
          left: 30,
          right: 30,
        ),
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
          child: Form(
            key: _SingUp_key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign Up ",
                  style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 50),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "See you growth and get consulting support ",
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: user_name_con,
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return 'please enter your User Name';
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
                      labelText: "User Name",
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(162, 255, 255, 255)),
                      prefixText: "  ",
                      hintText: "Full Name",
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
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: user_Email_con,
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
                      labelText: "Email",
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(162, 255, 255, 255)),
                      prefixText: "  ",
                      hintText: "Enter Your Email id",
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
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: user_password_con,
                    validator: (value) {
                      if (value!.isEmpty || value == null || value.length < 6) {
                        if (value.isEmpty) {
                          return 'please enter your Password';
                        } else if (value.length < 6) {
                          return 'minimum length of password 6 is required ';
                        }
                      }
                      return null;
                    },
                    obscureText: true,
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
                      labelText: "Password",
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(162, 255, 255, 255)),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Color.fromARGB(129, 255, 255, 255),
                      ),
                      prefixText: "  ",
                      hintText: "Enter Your Password",
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
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value == null || value.length < 6) {
                        if (value.isEmpty) {
                          return 'please enter your Password for confirmation';
                        } else if (value.length < 6) {
                          return 'minimum length of password 6 is required ';
                        }
                      }
                      return null;
                    },
                    obscureText: true,
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
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(162, 255, 255, 255)),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Color.fromARGB(129, 255, 255, 255),
                      ),
                      prefixText: "  ",
                      hintText: "Confirm Your Password",
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
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: user_phone_no_con,
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return 'please enter your Phone Number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: "Phone No",
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(162, 255, 255, 255)),
                      prefixText: "  ",
                      hintText: "Enter Your Phone number",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(118, 255, 255, 255)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
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
                    if (_SingUp_key.currentState!.validate()) {
                      print("validated");
                      var user_name = user_name_con.text.trim();
                      var user_Email = user_Email_con.text.trim();
                      var user_phone_no = user_phone_no_con.text.trim();
                      var user_password = user_password_con.text.trim();
                      Sign_up_service(
                        user_name,
                        user_Email,
                        user_phone_no,
                        user_password,
                      );
                      FirebaseAuth.instance.signOut();
                      Get.off(Login_Page());
                    } else {
                      print("Not validate");
                    }

                    print("object");
                  },

                  child: Container(
                    height: 60,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.off(Login_Page());
                    print("object");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Already Have a Account",
                        style: TextStyle(
                          color: Color.fromARGB(134, 255, 255, 255),
                        ),
                      ),
                      Text(
                        " Sign in",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
