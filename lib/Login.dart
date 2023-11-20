// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_nest2/SignUp.dart';
import 'package:list_nest2/Templets.dart';
import './forget_screen.dart';

class Login_Page extends StatefulWidget {
  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  @override
  bool ab = true;

  var email_con = TextEditingController();

  var password_con = TextEditingController();

  final _login_key = GlobalKey<FormState>();

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
            key: _login_key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login ",
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
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: TextFormField(
                    controller: email_con,
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
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: TextFormField(
                    controller: password_con,
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
                    obscureText: ab,
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
                      suffixIcon: IconButton(
                          onPressed: () {
                            if (ab == true) {
                              ab = false;
                              setState(() {});
                            } else {
                              ab = true;
                              setState(() {});
                            }
                          },
                          icon: Icon(
                            ab == true
                                ? Icons.remove_red_eye_outlined
                                : Icons.remove_red_eye,
                            color: ab
                                ? const Color.fromARGB(125, 255, 255, 255)
                                : Colors.white,
                          )),
                      labelText: "Password",
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(162, 255, 255, 255)),
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
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(Forget_password());
                      },
                      child: Text(
                        "Forget Password",
                        style: TextStyle(
                            color: Color.fromARGB(166, 255, 255, 255)),
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  // borderRadius: BorderRadius.circular(100),
                  onTap: () async {
                    if (_login_key.currentState!.validate()) {
                      print("validated");
                      String email_text = email_con.text.trim();
                      String password_text = password_con.text.trim();
                      try {
                        final User? firebaseUser = (await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email_text, password: password_text))
                            .user;

                        if (firebaseUser != null) {
                          Get.off(Templets_page());
                        } else {
                          print("check Email and password");
                        }
                      } on FirebaseAuthException catch (e) {
                        print("Error : $e");
                      }
                      ;
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
                      "Login",
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    " OR",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("object");
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(90),
                      // color: Colors.white,
                    ),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child:
                              Image.asset("lib/assets/images/google logo.png"),
                          height: 20,
                          width: 20,
                        ),
                        Text(
                          "Sign in with Google",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.off(Sign_Up_Page());
                    print("object");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Don't have an account",
                        style: TextStyle(
                          color: Color.fromARGB(134, 255, 255, 255),
                        ),
                      ),
                      Text(
                        " Sign Up",
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
          // color: Colors.white,
        ),
      )),
    ));
  }
}
