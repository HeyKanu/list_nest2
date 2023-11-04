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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            int length_of_lable = int.parse(snapshot.data!.docs[0]["Length"]);
            for (int j = 0; j < length_of_lable; j++) {
              Leble_Text.add(snapshot.data!.docs[0][j.toString()]);
              print(Leble_Text);
            }
            for (int j = 0; j < length_of_lable; j++) {
              Filds_Name.add(snapshot.data!.docs[1][j.toString()]);
              print(Leble_Text);
            }
            for (int j = 0; j < length_of_lable; j++) {
              Hint_Text.add(snapshot.data!.docs[0][j.toString()]);
              print(Leble_Text);
            }

            for (int i = 0; i < Filds_Name.length; i++) {
              if (Filds_Name[i] == "Text") {
                Form_Fields.add(
                  TextFormField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
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
                Form_Fields.add(
                  Container(
                    color: Colors.white,
                    child: Center(
                      child: Text("${DateTime.now()}"),
                    ),
                  ),
                );
              } else if (Filds_Name[i] == "Text Area") {
                Form_Fields.add(
                  TextFormField(
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
                Form_Fields.add(
                  TextFormField(
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
                Form_Fields.add(
                  TextFormField(
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
                Form_Fields.add(DropdownMenu(dropdownMenuEntries: []));
              }
            }
            //-----------------------------------------------------------------------------   Form build    ---------------------------------------------
            return Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 30),
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
                    child: GridView.builder(
                      itemCount: Form_Fields.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber,
                    ),
                    margin: EdgeInsets.all(20),
                    height: 100,
                    width: double.infinity,
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
