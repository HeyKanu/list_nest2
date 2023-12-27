import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_nest2/Data_show.dart';
import 'package:list_nest2/New_Form.dart';
import 'package:list_nest2/services.dart';

class Show_my_form extends StatefulWidget {
  String? Form_Name;
  String? Doc_Id;

  List? User_Data;
  var update;

  Show_my_form({this.Form_Name, this.Doc_Id, this.update, this.User_Data});

  @override
  State<Show_my_form> createState() => _Show_my_formState();
}

class _Show_my_formState extends State<Show_my_form> {
  List<Widget> Form_Fields = [];
  List<String> Filds_Name = [];
  List<String> Leble_Text = [];
  List<String> Hint_Text = [];
  List<String> User_entries = [];
  List<TextEditingController> Filds_controllers = [];
  bool? ab = true;
  User? current_user = FirebaseAuth.instance.currentUser;
  var Form_column;
  int? Doc_Lengths;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          // forceMaterialTransparency: true,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            widget.Form_Name.toString(),
            // style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.off(New_Form(
                    Form_name: widget.Form_Name,
                    load: true,
                    Filds_Name_L: Filds_Name,
                    Form_Fields_L: Form_Fields,
                    Hint_Text_L: Hint_Text,
                    Leble_Text_L: Leble_Text,
                    Grid_column_L: Form_column,
                    update: false,
                  ));
                },
                icon: Icon(Icons.edit))
          ],
        ),
        body: Container(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("${current_user?.uid}")
                .doc(widget.Form_Name)
                .collection("form_list")
                .where("UserId", isEqualTo: current_user?.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CupertinoActivityIndicator());
              }
              if (snapshot.data!.docs.isEmpty) {
                return Text("No data found");
              }
              if (snapshot != null && snapshot.data != null) {
                int length_of_lable =
                    int.parse(snapshot.data!.docs[0]["Length"]);
                Form_column = int.parse(snapshot.data!.docs[1]["Grid"]);
                Form_Fields.clear();
                Filds_Name.clear();
                Leble_Text.clear();
                Hint_Text.clear();
                User_entries.clear();
                for (int j = 0; j < length_of_lable; j++) {
                  Leble_Text.add(snapshot.data!.docs[0][j.toString()]);
                  print(Leble_Text);
                }
                for (int j = 0; j < length_of_lable; j++) {
                  Filds_Name.add(snapshot.data!.docs[1][j.toString()]);
                  print(Leble_Text);
                }
                for (int j = 0; j < length_of_lable; j++) {
                  Hint_Text.add(snapshot.data!.docs[2][j.toString()]);
                  print(Leble_Text);
                }

                for (int i = 0; i < Filds_Name.length; i++) {
                  if (Filds_Name[i] == "Text") {
                    // Filds_controllers.add(TextEditingController());
                    widget.update
                        ? User_entries.add(widget.User_Data![i])
                        : User_entries.add("null");
                    Form_Fields.add(
                      TextFormField(
                        controller: widget.update
                            ? (TextEditingController()..text = User_entries[i])
                            : TextEditingController(),
                        onChanged: (value) {
                          User_entries.replaceRange(i, i + 1, [value]);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: Hint_Text[i],
                          labelText: Leble_Text[i],
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
                  } else if (Filds_Name[i] == "Date") {
                    widget.update
                        ? User_entries.add(widget.User_Data![i])
                        : User_entries.add("null");

                    Form_Fields.add(
                      Container(
                        color: Colors.white,
                        child: Center(
                          child: Text("${DateTime.now()}"),
                        ),
                      ),
                    );
                  } else if (Filds_Name[i] == "Text Area") {
                    widget.update
                        ? User_entries.add(widget.User_Data![i])
                        : User_entries.add("null");
                    Form_Fields.add(
                      TextFormField(
                        controller: widget.update
                            ? (TextEditingController()..text = User_entries[i])
                            : TextEditingController(),
                        onChanged: (value) {
                          User_entries.replaceRange(i, i + 1, [value]);
                        },
                        minLines: 1,
                        maxLines: 4,
                        decoration: InputDecoration(
                          prefix: Text(" "),
                          labelText: Leble_Text[i],
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
                  } else if (Filds_Name[i] == "Number") {
                    widget.update
                        ? User_entries.add(widget.User_Data![i])
                        : User_entries.add("null");
                    Form_Fields.add(
                      TextFormField(
                        controller: widget.update
                            ? (TextEditingController()..text = User_entries[i])
                            : TextEditingController(),
                        onChanged: (value) {
                          User_entries.replaceRange(i, i + 1, [value]);
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefix: Text(" "),
                          contentPadding: EdgeInsets.zero,
                          hintText: Hint_Text[i],
                          labelText: Leble_Text[i],
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
                  } else if (Filds_Name[i] == "Password") {
                    widget.update
                        ? User_entries.add(widget.User_Data![i])
                        : User_entries.add("null");
                    Form_Fields.add(
                      TextFormField(
                        controller: widget.update
                            ? (TextEditingController()..text = User_entries[i])
                            : TextEditingController(),
                        onChanged: (value) {
                          User_entries.replaceRange(i, i + 1, [value]);
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          // suffixIcon: IconButton(
                          //     onPressed: () {
                          //       if (ab == true) {
                          //         ab = false;
                          //         setState(() {});
                          //         Form_Fields.clear();
                          //         Filds_Name.clear();
                          //         Leble_Text.clear();
                          //         Hint_Text.clear();
                          //         // User_entries.clear();
                          //       } else {
                          //         ab = true;
                          //       }
                          //     },
                          //     icon: Icon(ab == true
                          //         ? Icons.remove_red_eye_outlined
                          //         : Icons.remove_red_eye)),
                          contentPadding: EdgeInsets.zero,
                          hintText: Hint_Text[i],
                          labelText: Leble_Text[i],
                          // labelStyle: TextStyle(
                          //     shadows: [
                          //       Shadow(
                          //           color: Color.fromARGB(255, 0, 0, 0),
                          //           offset: Offset(0, 0),
                          //           blurRadius: 2)
                          //     ],
                          //     // color: Color.fromARGB(255, 226, 214, 160),
                          //     fontWeight: FontWeight.w500),

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
                  } else if (Filds_Name[i] == "Drop Down") {
                    User_entries.add("null");
                    Form_Fields.add(DropdownMenu(dropdownMenuEntries: []));
                  }
                }

                //-----------------------------------------------------------------------------   Form build    ---------------------------------------------
                return Container(
                  width: double.infinity,
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
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 3, left: 3),
                          child: GridView.builder(
                            itemCount: Form_Fields.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: Form_column,
                              mainAxisExtent: 70,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                // padding: EdgeInsets.all(5),
                                // color: Colors.white,
                                height: 20,
                                margin: EdgeInsets.all(10),
                                child: Form_Fields[index],
                              );
                            },
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          Map<String, String> Map_User_entries = {};
                          for (int i = 0; i < User_entries.length; i++) {
                            Map_User_entries[i.toString()] = User_entries[i];
                          }
                          Map_User_entries["uid"] =
                              "${current_user?.uid.toString()}";
                          Map_User_entries["Length"] = "${User_entries.length}";
                          if (widget.update == true) {
                            await FirebaseFirestore.instance
                                .collection("${current_user?.uid}")
                                .doc(widget.Form_Name)
                                .collection("User_entries")
                                .doc(widget.Doc_Id.toString())
                                .set(Map_User_entries);
                          } else {
                            await FirebaseFirestore.instance
                                .collection("${current_user?.uid}")
                                .doc(widget.Form_Name)
                                .collection("User_entries")
                                .doc()
                                .set(Map_User_entries);
                          }

                          print(User_entries);
                          Get.off(Data_show(
                            Form_name: widget.Form_Name,
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.amber,
                          ),
                          margin: EdgeInsets.all(20),
                          height: 50,
                          width: double.infinity,
                          child: Center(
                            child: Text("Submit"),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
        ));
  }
}
