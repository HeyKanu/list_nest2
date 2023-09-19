// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class New_Form extends StatelessWidget {
  var Form_name;
  New_Form({required this.Form_name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: My_Drawer(
        Form_name: Form_name,
      ),
      appBar: AppBar(
        foregroundColor: Colors.black,
        // forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          Form_name,
          // style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(),
      backgroundColor: Color.fromARGB(255, 1, 11, 27),
    );
  }
}

class My_Drawer extends StatelessWidget {
  var Form_name;
  My_Drawer({super.key, required this.Form_name});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Column(
        children: [
          Container(
            // padding: EdgeInsets.only(left: 10),
            width: double.infinity,
            height: 95,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 1, 11, 27),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 30,
                    // offset: Offset(1, 10),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  Form_name,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              // height: 600,
              width: double.infinity,
              margin: EdgeInsets.all(0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: const Color.fromARGB(255, 1, 11, 27),
                    child: Center(
                      child: Text(
                        "Number Of Column ",
                        style: TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 30,
                        width: 60,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            "1",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 60,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            "2",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 30,
                        width: 60,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            "3",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 60,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            "4",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: const Color.fromARGB(255, 1, 11, 27),
                    child: Center(
                      child: Text(
                        "Height Of Column ",
                        style: TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "H : ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        height: 30,
                        width: 80,
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 1, 11, 27),
                    ),
                    child: Center(
                      child: Text(
                        "Reset",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
