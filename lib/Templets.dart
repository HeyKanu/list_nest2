// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_nest2/Login.dart';
import 'package:list_nest2/show_form.dart';
import './New_Form.dart';

class Templets_page extends StatefulWidget {
  Templets_page({super.key});

  @override
  State<Templets_page> createState() => _Templets_pageState();
}

class _Templets_pageState extends State<Templets_page> {
  int a = 0;

  var Form_name_Controler = TextEditingController();

  List<String> Filds_Names = []; // Filds Names
  List<String> Text_Filds_Lable = []; // Text Filds Lable
  List<String> Text_Filds_Hint = []; // Text Filds Hint

  List<String> Form_names = []; // All Forms Name
  List<Widget> Form_Fields = []; // List of Fields creat by user
  bool Dcolor = false; //Divider color
  User? current_user = FirebaseAuth.instance.currentUser;

  // ______________________________________________________________   (Templet 1)   ____________________________________
  Widget R1({required String img, String? name}) {
    return GestureDetector(
      onTap: () {
        print("object");
      },
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 125,
          width: 210,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(50)),
                  ),
                  // clipBehavior: Clip.hardEdge,
                  width: 215,
                  height: 20,

                  child: Center(
                      child: Text(
                    "$name",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // ______________________________________________________________   (Templet 2)   ____________________________________
  Widget S1({required String img, String? name}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(3),
        child: Container(
          height: 125,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(50)),
                  ),
                  // clipBehavior: Clip.hardEdge,
                  width: 105,
                  height: 20,

                  child: Center(
                      child: Text(
                    "$name",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void Add_Hint_Lable() {
    Text_Filds_Lable.add("value1111");
    Text_Filds_Hint.add("value");
    // print(Text_Filds_Hint.length);
    print(Text_Filds_Lable);
    setState(() {});
  }

  void Add_Fields({required String field, required int index_of_H_L}) {
    if (field == "Text") {
      Form_Fields.add(
        TextFormField(
          onChanged: (value) {},
          decoration: InputDecoration(
            hintText: Text_Filds_Hint[index_of_H_L],
            labelText: Text_Filds_Lable[index_of_H_L],
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    } else if (field == "Date") {
      Form_Fields.add(
        Container(
          color: Colors.white,
          child: Center(
            child: Text("${DateTime.now()}"),
          ),
        ),
      );
    } else if (field == "Text Area") {
      Form_Fields.add(
        TextFormField(
          minLines: 1,
          maxLines: 4,
          decoration: InputDecoration(
            labelText: Text_Filds_Lable[index_of_H_L],
            contentPadding: EdgeInsets.zero,
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    } else if (field == "Number") {
      Form_Fields.add(
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: Text_Filds_Hint[index_of_H_L],
            labelText: Text_Filds_Lable[index_of_H_L],
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    } else if (field == "Password") {
      Form_Fields.add(
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: Text_Filds_Hint[index_of_H_L],
            labelText: Text_Filds_Lable[index_of_H_L],
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    } else if (field == "Drop Down") {
      Form_Fields.add(DropdownMenu(dropdownMenuEntries: []));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        // centerTitle: true,
        title: Text(
          Form_names.length > 0 ? "Resently used" : "Templets",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Get.offAll(Login_Page());
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      // backgroundColor: Color.fromARGB(255, 6, 1, 27),
      backgroundColor: Color.fromARGB(255, 1, 11, 27),
      body: Container(
          height: double.infinity,
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
          padding: EdgeInsets.all(10),
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // ______________________________________________________________________________   ( recently used templets )    ____________________________________________________________________________________
                  Container(
                      height: 150,
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("forms name")
                              .where("userId", isEqualTo: current_user?.uid)
                              .snapshots(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text("Something went wrong");
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                  child: CupertinoActivityIndicator());
                            }
                            if (snapshot.data!.docs.isEmpty) {
                              return Text("No data found");
                            }
                            if (snapshot != null && snapshot.data != null) {
                              Form_names.clear();

                              int length_of_Form_name =
                                  int.parse(snapshot.data!.docs[0]["Length"]);
                              for (int j = 0; j < length_of_Form_name; j++) {
                                Form_names.add(
                                    snapshot.data!.docs[0][j.toString()]);
                                print(Form_names);
                              }
                              return ListView.builder(
                                itemExtent: 105,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(Show_my_form(
                                        Form_Name: Form_names[index],
                                      ));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          Form_names[index],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: Form_names.length,
                              );

                              return Container();
                            }
                            return Container();
                          })),
                  Divider(
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // ______________________________________________________________________________   ( templets )    ____________________________________________________________________________________
                  Container(
                    padding: EdgeInsets.all(0),
                    // height: 550,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            R1(
                              img: "lib/assets/images/electonic goods.jpg",
                              name: "Electronic goods",
                            ),
                            S1(
                              img: "lib/assets/images/marketing.jpg",
                              name: "Digital Marke",
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            S1(
                                img: "lib/assets/images/payment.jpg",
                                name: "Payments"),
                            R1(
                                img: "lib/assets/images/mar.jpg",
                                name: "internet Connection"),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            R1(
                                img: "lib/assets/images/cab2.jpg",
                                name: "Cable Connection"),
                            S1(img: "lib/assets/images/Rent4.png", name: "Rent")
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [
                        //     S1(),
                        //     R1(),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // ______________________________________________________________________________   ( Floating Button )    ____________________________________________________________________________________
      floatingActionButton: Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: FloatingActionButton.extended(
          onPressed: () {
            Filds_Names.clear();
            Text_Filds_Lable.clear();
            Text_Filds_Hint.clear();
            Form_Fields.clear();
            Form_name_Controler.text = "Form ${a.toString()}";
            setState(() {});
            // Form_name = "form" + "${a.toString()}";

            // ______________________________________________________________________________   ( Dialog Box )    ____________________________________________________________________________________
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Color.fromARGB(255, 1, 11, 27),
                  title: Text(
                    "Name of Form",
                    // Form_name,
                    style: TextStyle(color: Colors.white),
                  ),
                  content: Container(
                    // padding: EdgeInsets.only(bottom: 10),
                    width: 350,
                    height: 25,
                    child: TextFormField(
                      // style: TextStyle(height: 0.3),
                      controller: Form_name_Controler,
                      minLines: 1,
                      maxLines: 1,
                      autofocus: true,
                      autocorrect: true,
                      cursorColor: const Color.fromARGB(255, 0, 0, 0),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: Colors.white,
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () async {
                          // Form_names.add(Form_name_Controler.text);

                          Form_names.insert(0, Form_name_Controler.text);
                          Form_name_Controler.clear();
                          await FirebaseFirestore.instance
                              .collection(Form_names[0])
                              .doc()
                              .set({});
                          print(Form_names);
                          setState(() {
                            a++;
                            Dcolor = true;
                          });
                          // _____________________________________________________________    (Data base work)    _______________________________________
                          Map<String, String> Map_Form_Names = {};
                          for (int i = 0; i < Form_names.length; i++) {
                            Map_Form_Names[i.toString()] = Form_names[i];
                          }
                          Map_Form_Names["userId"] =
                              current_user!.uid.toString();
                          Map_Form_Names["Length"] =
                              Form_names.length.toString();

                          await FirebaseFirestore.instance
                              .collection("forms name")
                              .doc("names")
                              .set(Map_Form_Names);
// ____________________________________________________________________________________________   (go to next page)   ______________________________________
                          Get.off(New_Form(
                            Form_name: Form_names[0],
                            Add_Field: Add_Fields,
                            Form_Fields: Form_Fields,
                            Filds_Name: Filds_Names,
                            Add_Hint_Lable: Add_Hint_Lable,
                            Leble_Text: Text_Filds_Lable,
                            Hint_Text: Text_Filds_Hint,
                          ));
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                );
              },
            );
            // Get.off(New_Form());
          },
          label: Text(
            "New Form",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          icon: Icon(
            Icons.add,
            color: Color.fromARGB(255, 0, 0, 0),
            size: 30,
          ),
          backgroundColor: Color.fromARGB(255, 151, 146, 146),
        ),
      ),
    );
  }
}
