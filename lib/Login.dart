// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_nest2/SignUp.dart';
import 'package:list_nest2/Templets.dart';

class Login_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 1, 11, 20),
        body: Center(
            child: SingleChildScrollView(
          child: Container(
            height: 550,
            width: 300,
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
                      fontSize: 10,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
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
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Color.fromARGB(129, 255, 255, 255),
                      ),
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
                GestureDetector(
                  // borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    Get.off(Templets_page());
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
            // color: Colors.white,
          ),
        )));
  }
}
