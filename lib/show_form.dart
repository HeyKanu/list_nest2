import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_nest2/services.dart';

class Show_my_form extends StatefulWidget {
  String? Form_Name;
  User? current_user = FirebaseAuth.instance.currentUser;
  Show_my_form({
    // required this.Filds_Name,
    // this.Leble_Text,
    // this.Hint_Text,
    this.Form_Name,
  });

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
        ),
        body: Container(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("form")
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
                int Form_column = int.parse(snapshot.data!.docs[1]["Grid"]);
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
                    User_entries.add("null");
                    Form_Fields.add(
                      TextFormField(
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
                    User_entries.add("null");

                    Form_Fields.add(
                      Container(
                        color: Colors.white,
                        child: Center(
                          child: Text("${DateTime.now()}"),
                        ),
                      ),
                    );
                  } else if (Filds_Name[i] == "Text Area") {
                    User_entries.add("null");
                    Form_Fields.add(
                      TextFormField(
                        onChanged: (value) {
                          User_entries.replaceRange(i, i + 1, [value]);
                        },
                        minLines: 1,
                        maxLines: 4,
                        decoration: InputDecoration(
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
                    User_entries.add("null");
                    Form_Fields.add(
                      TextFormField(
                        onChanged: (value) {
                          User_entries.replaceRange(i, i + 1, [value]);
                        },
                        keyboardType: TextInputType.number,
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
                  } else if (Filds_Name[i] == "Password") {
                    User_entries.add("null");
                    Form_Fields.add(
                      TextFormField(
                        onChanged: (value) {
                          User_entries.replaceRange(i, i + 1, [value]);
                        },
                        obscureText: true,
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
                          await FirebaseFirestore.instance
                              .collection("form")
                              .doc(widget.Form_Name)
                              .collection("User_entries")
                              .doc()
                              .set(Map_User_entries);
                          print(User_entries);
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
