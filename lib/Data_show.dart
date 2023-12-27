import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './show_form.dart';
import './full_data.dart';

class Data_show extends StatefulWidget {
  String? Form_name;
  Data_show({this.Form_name});

  @override
  State<Data_show> createState() => _Data_showState();
}

class _Data_showState extends State<Data_show> {
  List<String> Lables = [];
  List<List> values = [];
  List<DataColumn> my_columns = [];
  List<DataRow> my_row = [];
  int length_of_lable = 0;
  var length_of_entries;
  User? current_user = FirebaseAuth.instance.currentUser;
  var search_control = TextEditingController();
  bool search = false;
  bool a = true;
  List<List> search_values = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Lables.clear();
    values.clear();
    my_columns.clear();
    my_row.clear();
    setState(() {});
    print("object...................");
  }

  void search_filter(String element) {
    if (element.isEmpty) {
      search_values.clear();
      for (int i = 0; i < values.length; i++) {
        search_values.add(values[i]);
      }
      // search_results = Form_names;
    } else {
      search_values.clear();
      for (int i = 0; i < values.length; i++) {
        print("I=" + i.toString());
        if (values[i][0].toLowerCase().startsWith(element.toLowerCase())) {
          search_values.add(values[i]);
        }
      }
    }

    // print("search r $search_results");
  }

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
        actions: [
          AnimatedContainer(
              margin: EdgeInsets.all(5),
              width: search ? 300 : 45,
              // height: 10,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(80)),
              duration: Duration(milliseconds: 200),
              child: search
                  ? TextField(
                      controller: search_control..text.isEmpty,
                      onChanged: (value) {
                        a = false;
                        print(value);
                        search_filter(value);
                        setState(() {});
                      },
                      autocorrect: true,
                      autofocus: true,
                      decoration: InputDecoration(
                          prefixIcon: IconButton(
                              onPressed: () {
                                search = false;
                                a = true;
                                search_control.clear();
                                setState(() {});
                              },
                              icon: Icon(Icons.close)),
                          hintText: " Search ",
                          contentPadding: EdgeInsets.only(left: 10),
                          suffixIcon: Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(80),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(80),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(80))),
                    )
                  : InkWell(
                      onTap: () {
                        search = true;

                        setState(() {});
                      },
                      child: Icon(
                        Icons.search,
                        color: const Color.fromARGB(172, 0, 0, 0),
                      ),
                    ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.off(Show_my_form(
            Form_Name: widget.Form_name,
            update: false,
          ));
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
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
                      .collection("${current_user?.uid}")
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
                      // snapshot.data!.docs[0] [];
                      length_of_lable =
                          int.parse(snapshot.data!.docs[0]["Length"]);
                      print("Label Length= $length_of_lable");
                      int Form_column =
                          int.parse(snapshot.data!.docs[1]["Grid"]);
                      Lables.clear();

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
                      .collection("${current_user?.uid}")
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
                      print("..................");
                      int length_of_values = snapshot.data!.docs.length;
                      length_of_entries =
                          int.parse(snapshot.data!.docs[0]["Length"]);

                      values.clear();

                      for (int i = 0; i < length_of_values; i++) {
                        List<String> temp = [];
                        for (int j = 0; j < length_of_lable; j++) {
                          print("J......$length_of_entries");
                          if (int.parse(snapshot.data!.docs[i]["Length"]) - 1 <
                              j) {
                            temp.add("Null");
                          } else {
                            temp.add(snapshot.data!.docs[i][j.toString()]);
                          }
                        }
                        values.add(temp);
                        print(snapshot.data!.docs.length);
                        print("L============ ${length_of_entries}");
                        print("Length============ ${temp.length}");
                      }
                      print("1111111111111111111");
                      print(values);
                      my_columns.clear();
                      my_row.clear();

                      for (int i = 0; i < length_of_lable; i++) {
                        print(Lables[i]);
                        my_columns.add(DataColumn(
                            label: Center(
                          child: Text(
                            Lables[i],
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        )));
                      }
                      my_columns.insert(
                          0,
                          DataColumn(
                              label: Center(
                            child: Text(
                              "S.no",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )));
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                      int My_lenght = a ? values.length : search_values.length;
                      for (int i = 0; i < My_lenght; i++) {
                        List<DataCell> temp = [];
                        for (int j = 0; j < length_of_lable; j++) {
                          temp.add(DataCell(
                            onTap: () {
                              Get.to(() => full_Data(
                                    lebals: Lables,
                                    User_Data: a ? values[i] : search_values[i],
                                    Doc_Id: snapshot.data!.docs[i].id,
                                    Form_Name: widget.Form_name,
                                  ));
                            },
                            Center(
                              child: Text(
                                a ? values[i][j] : search_values[i][j],
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        174, 255, 255, 255)),
                              ),
                            ),
                          ));
                        }
                        temp.insert(
                            0,
                            DataCell(Center(
                              child: Text(
                                (i + 1).toString(),
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        174, 255, 255, 255)),
                              ),
                            )));
                        my_row.add(DataRow(
                            cells: temp,
                            onLongPress: () {
                              print("object");
                            }));
                      }

                      return Expanded(
                        // child: ListView.builder(
                        //   itemCount: snapshot.data!.docs.length,
                        //   itemBuilder: (context, index) {
                        //     var Zero = snapshot.data!.docs[index]["0"];
                        //     var One = snapshot.data!.docs[index]["1"];
                        //     return GestureDetector(
                        //       onTap: () {
                        //         print(length_of_entries);
                        //         print(values);
                        //       },
                        //       child: Card(
                        //         child: ListTile(
                        //           title: Text(Zero),
                        //           subtitle: Text(One),
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              border: TableBorder(
                                horizontalInside: BorderSide(
                                    color: const Color.fromARGB(
                                        167, 255, 255, 255)),
                                // verticalInside: BorderSide(
                                //     color: const Color.fromARGB(
                                //         167, 255, 255, 255)),
                                // verticalInside: BorderSide(color: Colors.white),
                              ),
                              columns: my_columns,
                              rows: my_row,
                            ),
                          ),
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
