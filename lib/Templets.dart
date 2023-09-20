// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './New_Form.dart';

class Templets_page extends StatefulWidget {
  Templets_page({super.key});

  @override
  State<Templets_page> createState() => _Templets_pageState();
}

class _Templets_pageState extends State<Templets_page> {
  int a = 0;

  var Form_name_Controler = TextEditingController();

  List<String> Templets_Names = [
    "Temp 1",
    "Temp 2",
    "Temp 3",
    "Temp 4",
    "Temp 5",
    "Temp 6",
    "Temp 7",
    "Temp 8",
    "Temp 9",
  ];

  List<Widget> Select_Form = [];
  // recently used templets
  List<String> Form_names = [];
  // All Forms Name

  bool Dcolor = false; //Divider color

  // var Form_name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(forceMaterialTransparency: true),
      // backgroundColor: Color.fromARGB(255, 6, 1, 27),
      backgroundColor: Color.fromARGB(255, 1, 11, 27),
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
          padding: EdgeInsets.all(10),
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // ______________________________________________________________________________   ( recently used templets )    ____________________________________________________________________________________
                  Container(
                    height: Form_names.length > 0 ? 150 : 0,
                    child: ListView.builder(
                      itemExtent: 105,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          color: Colors.white,
                          child: Center(child: Text(Form_names[index])),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: Form_names.length,
                    ),
                  ),
                  Divider(
                    color: Dcolor == false
                        ? Color.fromARGB(255, 1, 11, 27)
                        : Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // ______________________________________________________________________________   ( templets )    ____________________________________________________________________________________
                  Container(
                    padding: EdgeInsets.all(0),
                    height: 550,
                    width: double.infinity,
                    child: GridView.builder(
                      physics: ScrollPhysics(parent: ScrollPhysics()),
                      itemCount: Templets_Names.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 160),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            print("object");
                          },
                          child: Container(
                            color: Colors.white,
                            child: Center(
                              child: Text(Templets_Names[index]),
                            ),
                          ),
                        );
                      },
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
                    width: double.infinity,
                    // height: 50,
                    child: TextFormField(
                      controller: Form_name_Controler,
                      minLines: 1,
                      maxLines: 1,
                      autofocus: true,
                      autocorrect: true,
                      cursorColor: const Color.fromARGB(255, 0, 0, 0),
                      decoration: InputDecoration(
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
                        onPressed: () {
                          Form_names.add(Form_name_Controler.text);
                          Form_name_Controler.clear();
                          print(Form_names);
                          setState(() {
                            a++;
                            Dcolor = true;
                          });

                          Get.off(New_Form(
                            Form_name: Form_names[Form_names.length - 1],
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
