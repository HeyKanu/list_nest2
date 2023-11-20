import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './show_form.dart';

class Data_show extends StatefulWidget {
  String? Form_name;
  Data_show({this.Form_name});

  @override
  State<Data_show> createState() => _Data_showState();
}

class _Data_showState extends State<Data_show> {
  List<DataCell> table_cell = [];
  List<DataColumn> table_column = [];
  List<String> Lables = [];
  List<String> values = [];
  User? current_user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        // forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.Form_name.toString(),
          // style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.to(Show_my_form(
          Form_Name: widget.Form_name,
        ));
      }),
      body: Container(
          padding: EdgeInsets.only(top: 10),
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
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("form")
                      .doc(widget.Form_name)
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
                      int Form_column =
                          int.parse(snapshot.data!.docs[1]["Grid"]);
                      for (int j = 0; j < length_of_lable; j++) {
                        Lables.add(snapshot.data!.docs[0][j.toString()]);
                        print(Lables);
                      }
                      return SizedBox();
                    }
                    return SizedBox();
                  }),
              // ____________________________________________________________________________
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("form")
                      .doc(widget.Form_name)
                      .collection("User_entries")
                      .where("uid", isEqualTo: current_user?.uid)
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
                      // int length_of_lable =
                      //     int.parse(snapshot.data!.docs[0]["Length"]);
                      // int Form_column = int.parse(snapshot.data!.docs[1]["Grid"]);
                      // for (int j = 0; j < length_of_lable; j++) {
                      //   Lables.add(snapshot.data!.docs[0][j.toString()]);
                      //   print(Lables);
                      // }
                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            var Zero = snapshot.data!.docs[index]["0"];
                            var One = snapshot.data!.docs[index]["1"];
                            return GestureDetector(
                              onTap: () {},
                              child: Card(
                                child: ListTile(
                                  title: Text(Zero),
                                  subtitle: Text(One),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return SizedBox();
                  }),
            ],
          )),
    );
  }
}
