// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names, unused_import

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:get/get.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import './show_form.dart';

class New_Form extends StatefulWidget {
  var Form_name;
  Function? Add_Field;
  Function? Add_Hint_Lable;

  List<Widget>? Form_Fields;
  List<String>? Filds_Name;
  List<String>? Leble_Text;
  List<String>? Hint_Text;
  New_Form({
    required this.Form_name,
    this.Add_Field,
    this.Form_Fields,
    this.Filds_Name,
    required this.Add_Hint_Lable,
    required this.Leble_Text,
    required this.Hint_Text,
  });

  @override
  State<New_Form> createState() => _New_FormState();
}

class _New_FormState extends State<New_Form> {
  double height_Of_Container = 70;
  bool edit_Box = false;
  User? currrent_user = FirebaseAuth.instance.currentUser;
  int Grid_column = 1;
  double height_of_field = 80;
  var index_Num; //Selected field
  void Refresh(int i) {
    Grid_column = i;
    FirebaseFirestore.instance
        .collection(widget.Form_name)
        .doc("Number of column")
        .set({"Grid": Grid_column});
    setState(() {});
  }

  void chang_Hei_f(double h) {
    height_of_field = h;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: My_Drawer(
        Form_name: widget.Form_name,
        Refresh: Refresh,
        height_ch: chang_Hei_f,
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
              onTap: () async {
                Map<String, String> Map_Filds_Name =
                    {}; //firebase me store karne ke liye map me convert kiya
                Map<String, String> Map_Leble_Text =
                    {}; //firebase me store karne ke liye map me convert kiya
                Map<String, String> Map_Hint_Text =
                    {}; //firebase me store karne ke liye map me convert kiya
                for (int i = 0; i < widget.Filds_Name!.length; i++) {
                  Map_Filds_Name[i.toString()] = widget.Filds_Name![i];
                }
                Map_Filds_Name["UserId"] = "${currrent_user?.uid}";
                Map_Filds_Name["Length"] = "${widget.Filds_Name!.length}";
                await FirebaseFirestore.instance
                    .collection("form")
                    .doc(widget.Form_name)
                    .collection("form_list")
                    .doc("filds name")
                    .set(Map_Filds_Name);

                for (int i = 0; i < widget.Leble_Text!.length; i++) {
                  Map_Leble_Text[i.toString()] = widget.Leble_Text![i];
                }
                Map_Leble_Text["UserId"] = "${currrent_user?.uid}";
                Map_Leble_Text["Length"] = "${widget.Leble_Text!.length}";
                await FirebaseFirestore.instance
                    .collection("form")
                    .doc(widget.Form_name)
                    .collection("form_list")
                    .doc("Lables Text")
                    .set(Map_Leble_Text);
                for (int i = 0; i < widget.Hint_Text!.length; i++) {
                  Map_Hint_Text[i.toString()] = widget.Hint_Text![i];
                }
                Map_Hint_Text["UserId"] = "${currrent_user?.uid}";
                Map_Hint_Text["Length"] =
                    "${widget.Hint_Text!.length.toString()}";
                await FirebaseFirestore.instance
                    .collection("form")
                    .doc(widget.Form_name)
                    .collection("form_list")
                    .doc("hint Text")
                    .set(Map_Hint_Text);
                // print(Map_Filds_Name);
                widget.Filds_Name!.clear();
                widget.Hint_Text!.clear();
                widget.Leble_Text!.clear();
                Get.to(() => Show_my_form(
                      // Filds_Name: widget.Filds_Name,
                      // Hint_Text: widget.Hint_Text,
                      // Leble_Text: widget.Leble_Text,
                      Form_Name: widget.Form_name,
                    ));
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
            // ________________________________________________________________________________   (  Edit Box  )    _______________________________________________________________________
            edit_Box
                ? AnimatedContainer(
                    duration: Duration(microseconds: 100000),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 215,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Table(
                              // border: TableBorder.all(),
                              columnWidths: {
                                0: FixedColumnWidth(85),
                                2: FixedColumnWidth(50),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(
                                  children: [
                                    Text("Lable Text"),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      height: 30,
                                      width: 100,
                                      child: TextFormField(
                                        controller: TextEditingController(
                                          text: widget
                                              .Leble_Text![index_Num!.toInt()],
                                        ),
                                        onChanged: (value) {
                                          widget.Leble_Text!.replaceRange(
                                              index_Num,
                                              index_Num + 1,
                                              [value]);
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.zero,
                                          filled: true,
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    IconButton.outlined(
                                      onPressed: () {
                                        widget.Form_Fields!
                                            .removeAt(index_Num!.toInt());
                                        widget.Filds_Name!
                                            .removeAt(index_Num!.toInt());
                                        widget.Leble_Text!
                                            .removeAt(index_Num!.toInt());
                                        widget.Hint_Text!
                                            .removeAt(index_Num!.toInt());
                                        edit_Box = false;
                                        setState(() {});
                                      },
                                      icon: Icon(Icons.delete),
                                    )
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text("Hint Text"),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      height: 30,
                                      width: 100,
                                      child: TextFormField(
                                        controller: TextEditingController(
                                          text: widget
                                              .Hint_Text![index_Num!.toInt()],
                                        ),
                                        onChanged: (value) {
                                          widget.Hint_Text!.replaceRange(
                                              index_Num - 1,
                                              index_Num,
                                              [value]);
                                          setState(() {});
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.zero,
                                          filled: true,
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    SizedBox()
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      margin:
                                          EdgeInsets.only(right: 5, left: 10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.check_box,
                                            color:
                                                Color.fromARGB(255, 1, 33, 70),
                                          ),
                                          Text(" Number"),
                                        ],
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      margin:
                                          EdgeInsets.only(right: 5, left: 22),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.check_box,
                                            color:
                                                Color.fromARGB(255, 1, 33, 70),
                                          ),
                                          Text(" Date"),
                                        ],
                                      )),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      margin:
                                          EdgeInsets.only(right: 5, left: 10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.check_box,
                                            color:
                                                Color.fromARGB(255, 1, 33, 70),
                                          ),
                                          Text(" Password"),
                                        ],
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5, left: 10),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.check_box,
                                          color: Color.fromARGB(255, 1, 33, 70),
                                        ),
                                        Text(" Phone Number"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                edit_Box = false;
                                setState(() {});
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 1, 33, 70),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: double.infinity,
                                height: 40,
                                child: Center(
                                    child: Text(
                                  "Done",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                :
                // ________________________________________________________________________________   (  Add Fields Box  )    _______________________________________________________________________
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      //_______________________________________________________________________________  (add text)  ________________________________________
                                      GestureDetector(
                                        onTap: () {
                                          widget.Filds_Name!.add("Text");
                                          int Filds_Name_Length =
                                              widget.Filds_Name!.length;
                                          widget
                                              .Add_Hint_Lable!(); // add hint and lable text

                                          widget.Add_Field!(
                                              field: widget.Filds_Name![
                                                  Filds_Name_Length - 1],
                                              index_of_H_L:
                                                  Filds_Name_Length - 1);
                                          // =================================

                                          setState(() {});
                                          print(Filds_Name_Length - 1);
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 160,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(),
                                          ),
                                          child: Center(
                                            child: Text("Text"),
                                          ),
                                        ),
                                      ),
                                      //_______________________________________________________________________________  (add Date)  ________________________________________
                                      GestureDetector(
                                        onTap: () {
                                          widget.Filds_Name!.add("Date");
                                          int Filds_Name_Length =
                                              widget.Filds_Name!.length;
                                          widget
                                              .Add_Hint_Lable!(); // add hint and lable text

                                          widget.Add_Field!(
                                              field: widget.Filds_Name![
                                                  Filds_Name_Length - 1],
                                              index_of_H_L:
                                                  Filds_Name_Length - 1);
                                          setState(() {});
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 160,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      //_______________________________________________________________________________  (add text Area)  ________________________________________
                                      GestureDetector(
                                        onTap: () {
                                          widget.Filds_Name!.add("Text Area");
                                          int Filds_Name_Length =
                                              widget.Filds_Name!.length;
                                          widget
                                              .Add_Hint_Lable!(); // add hint and lable text

                                          widget.Add_Field!(
                                              field: widget.Filds_Name![
                                                  Filds_Name_Length - 1],
                                              index_of_H_L:
                                                  Filds_Name_Length - 1);
                                          setState(() {});
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 160,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(),
                                          ),
                                          child: Center(
                                            child: Text("Text area"),
                                          ),
                                        ),
                                      ),
                                      //_______________________________________________________________________________  (add Number)  ________________________________________
                                      GestureDetector(
                                        onTap: () {
                                          widget.Filds_Name!.add("Number");
                                          int Filds_Name_Length =
                                              widget.Filds_Name!.length;
                                          widget
                                              .Add_Hint_Lable!(); // add hint and lable text

                                          widget.Add_Field!(
                                              field: widget.Filds_Name![
                                                  Filds_Name_Length - 1],
                                              index_of_H_L:
                                                  Filds_Name_Length - 1);
                                          setState(() {});
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 160,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      //_______________________________________________________________________________  (add Password)  ________________________________________
                                      GestureDetector(
                                        onTap: () {
                                          widget.Filds_Name!.add("Password");
                                          int Filds_Name_Length =
                                              widget.Filds_Name!.length;
                                          widget
                                              .Add_Hint_Lable!(); // add hint and lable text

                                          widget.Add_Field!(
                                              field: widget.Filds_Name![
                                                  Filds_Name_Length - 1],
                                              index_of_H_L:
                                                  Filds_Name_Length - 1);

                                          setState(() {});
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 160,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(),
                                          ),
                                          child: Center(
                                            child: Text("Password"),
                                          ),
                                        ),
                                      ),
                                      //_______________________________________________________________________________  (add Drop Down)  ________________________________________
                                      GestureDetector(
                                        onTap: () {
                                          widget.Filds_Name!.add("Drop Down");
                                          int Filds_Name_Length =
                                              widget.Filds_Name!.length;
                                          widget
                                              .Add_Hint_Lable!(); // add hint and lable text

                                          widget.Add_Field!(
                                              field: widget.Filds_Name![
                                                  Filds_Name_Length - 1],
                                              index_of_H_L:
                                                  Filds_Name_Length - 1);
                                          setState(() {});
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 160,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
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
            // __________________________________________________________________________   (Pull Icon)   ______________________________________________________________________
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
                        color: edit_Box == true
                            ? Color.fromARGB(0, 255, 255, 255)
                            : Colors.white,
                      )),
                ],
              ),
            ),

            // __________________________________________________________________________   (Form Build)   ______________________________________________________________________
            Expanded(
              child: Container(
                width: double.infinity,
                // height: MediaQuery.of(context).size.height - 450,
                child: GridView.builder(
                  itemCount: widget.Form_Fields!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: Grid_column,
                    mainAxisExtent: height_of_field,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        index_Num = index;
                        edit_Box = true;
                        setState(() {});
                        print("object");
                        print(index_Num);
                      },
                      child: Container(
                        // padding: EdgeInsets.all(5),
                        // color: Colors.white,
                        height: 20,
                        margin: EdgeInsets.all(10),
                        child: AbsorbPointer(
                          child: widget.Form_Fields![index],
                          absorbing: true,
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      // backgroundColor: Color.fromARGB(255, 1, 11, 27),
    );
  }
}

class My_Drawer extends StatefulWidget {
  var Form_name;

  late Function Refresh;
  late Function height_ch;
  My_Drawer(
      {super.key,
      required this.Form_name,
      required this.Refresh,
      required this.height_ch});

  @override
  State<My_Drawer> createState() => _My_DrawerState();
}

class _My_DrawerState extends State<My_Drawer> {
  bool c1 = false, c2 = false, c3 = false, c4 = false;
  var height = 70;
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
                  widget.Form_name,
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
                      GestureDetector(
                        onTap: () {
                          c1 = true;
                          c2 = false;
                          c3 = false;
                          c4 = false;
                          widget.Refresh(1);
                          setState(() {});
                        },
                        child: Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: c1
                                  ? Color.fromARGB(255, 1, 18, 41)
                                  : Color.fromARGB(255, 4, 51, 116)),
                          child: Center(
                            child: Text(
                              "1",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          c1 = false;
                          c2 = true;
                          c3 = false;
                          c4 = false;
                          widget.Refresh(2);
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: c2
                                  ? Color.fromARGB(255, 1, 18, 41)
                                  : Color.fromARGB(255, 4, 51, 116)),
                          height: 30,
                          width: 60,
                          child: Center(
                            child: Text(
                              "2",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
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
                      GestureDetector(
                        onTap: () {
                          c1 = false;
                          c2 = false;
                          c3 = true;
                          c4 = false;
                          widget.Refresh(3);
                          setState(() {});
                        },
                        child: Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: c3
                                  ? Color.fromARGB(255, 1, 18, 41)
                                  : Color.fromARGB(255, 4, 51, 116)),
                          child: Center(
                            child: Text(
                              "3",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          c1 = false;
                          c2 = false;
                          c3 = false;
                          c4 = true;
                          widget.Refresh(4);
                          setState(() {});
                        },
                        child: Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: c4
                                ? Color.fromARGB(255, 1, 18, 41)
                                : Color.fromARGB(255, 4, 51, 116),
                          ),
                          child: Center(
                            child: Text(
                              "4",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
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
                          controller:
                              TextEditingController(text: height.toString()),
                          onChanged: (value) {
                            height = int.parse(value);
                            print(height);
                            widget.height_ch(height);
                          },
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
