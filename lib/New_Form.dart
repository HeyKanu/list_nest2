// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class New_Form extends StatefulWidget {
  var Form_name;
  New_Form({required this.Form_name});

  @override
  State<New_Form> createState() => _New_FormState();
}

class _New_FormState extends State<New_Form> {
  double height_Of_Container = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: My_Drawer(
        Form_name: widget.Form_name,
      ),
      appBar: AppBar(
        foregroundColor: Colors.black,
        // forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.Form_name,
          // style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                print("object");
              },
              child: Icon(
                Icons.save_as_outlined,
                size: 30,
              ),
            ),
          ),
        ],
      ),
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
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(microseconds: 100000),
              // color: Color.fromARGB(255, 154, 164, 168),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50,
                            width: double.infinity,
                            // color: Colors.amber,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //_______________________________________________________________________________  (add text)  ________________________________________
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 160,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(),
                                    ),
                                    child: Center(
                                      child: Text("Text"),
                                    ),
                                  ),
                                ),
                                //_______________________________________________________________________________  (add Date)  ________________________________________
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 160,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(),
                                    ),
                                    child: Center(
                                      child: Text("Date"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            // color: Colors.amber,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //_______________________________________________________________________________  (add text Area)  ________________________________________
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 160,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(),
                                    ),
                                    child: Center(
                                      child: Text("Text area"),
                                    ),
                                  ),
                                ),
                                //_______________________________________________________________________________  (add Number)  ________________________________________
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 160,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(),
                                    ),
                                    child: Center(
                                      child: Text("Number"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            // color: Colors.amber,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //_______________________________________________________________________________  (add Password)  ________________________________________
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 160,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(),
                                    ),
                                    child: Center(
                                      child: Text("Password"),
                                    ),
                                  ),
                                ),
                                //_______________________________________________________________________________  (add Drop Down)  ________________________________________
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 160,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(),
                                    ),
                                    child: Center(
                                      child: Text("Drop Down"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              height: height_Of_Container,
              width: double.infinity,
            ),
            Container(
              height: 2,
              width: double.infinity,
              color: Colors.white,
            ),
            Container(
              padding: EdgeInsets.only(top: 0),
              // color: Colors.amber,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        height_Of_Container =
                            height_Of_Container == 70 ? 190 : 70;
                        setState(() {});

                        print("object");
                      },
                      icon: Icon(
                        height_Of_Container == 70
                            ? Icons.arrow_drop_down_outlined
                            : Icons.arrow_drop_up_outlined,
                        size: 30,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      // backgroundColor: Color.fromARGB(255, 1, 11, 27),
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
