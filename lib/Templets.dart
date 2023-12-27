// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables, unused_import, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_nest2/Data_show.dart';
import 'package:list_nest2/Login.dart';
import 'package:list_nest2/show_form.dart';
import './New_Form.dart';
import './my_providers.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Templets_page extends StatefulWidget {
  Templets_page({super.key});

  @override
  State<Templets_page> createState() => _Templets_pageState();
}

class _Templets_pageState extends State<Templets_page> {
  var Form_name_Controler = TextEditingController();

  // List<String> Form_names = []; // All Forms Name
  // List<Color> SCC = []; // selected container color

  bool Dcolor = false; //Divider color
  bool error = false;
  bool error1 = false;
  bool abc = false;
  var Name;
  User? current_user = FirebaseAuth.instance.currentUser;
  var search_control = TextEditingController();
  List search_results = <String>[];
  List Trash = <String>[];
  bool a = true;
  @override
  @override
  Widget Delet_form(String form_name, List trash) {
    return Column(
      children: [
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(current_user!.uid)
              .doc(form_name)
              .collection("User_entries")
              .where("uid", isEqualTo: current_user?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot != null && snapshot.data != null) {
              int length_Doc = snapshot.data!.docs.length;

              for (int i = 0; i < length_Doc; i++) {
                var Do_Id = snapshot.data!.docs[i].id;
                FirebaseFirestore.instance
                    .collection(current_user!.uid)
                    .doc(form_name)
                    .collection("User_entries")
                    .doc(Do_Id)
                    .delete();
              }

              // setState(() {});

              // form_name = "";
              return SizedBox();
            }
            return SizedBox();
          },
        ),
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(current_user!.uid)
              .doc(form_name)
              .collection("form_list")
              .where("UserId", isEqualTo: current_user?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot != null && snapshot.data != null) {
              int length_Doc = snapshot.data!.docs.length;

              for (int i = 0; i < length_Doc; i++) {
                var Do_Id = snapshot.data!.docs[i].id;
                FirebaseFirestore.instance
                    .collection(current_user!.uid)
                    .doc(form_name)
                    .collection("form_list")
                    .doc(Do_Id)
                    .delete();
              }
              abc = false;
              // setState(() {});
              return SizedBox();
            }
            return SizedBox();
          },
        ),
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(current_user!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot != null && snapshot.data != null) {
              trash.remove(form_name);
              int length_Trash = trash.length;
              Map<String, String> map_Trash = {};

              for (int i = 0; i < length_Trash; i++) {
                map_Trash[i.toString()] = trash[i];
              }
              map_Trash["Length"] = trash.length.toString();
              map_Trash["userId"] = current_user!.uid.toString();
              FirebaseFirestore.instance
                  .collection("${current_user?.uid}")
                  .doc("Trash")
                  .set(map_Trash);
              return SizedBox();
            }
            return SizedBox();
          },
        ),
      ],
    );
  }

  void search_filter(String element) {
    final provider_object = Provider.of<my_providers>(context, listen: false);
    if (element.isEmpty) {
      search_results.clear();
      for (int i = 0; i < provider_object.Forms_name.length; i++) {
        search_results.add(provider_object.Forms_name[i]);
      }
      // search_results = Form_names;
    } else {
      search_results.clear();
      for (int i = 0; i < provider_object.Forms_name.length; i++) {
        print("I=" + i.toString());
        if (provider_object.Forms_name[i]
            .toLowerCase()
            .startsWith(element.toLowerCase())) {
          search_results.add(provider_object.Forms_name[i]);
        }
      }
    }

    print("search r $search_results");
  }

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

  @override
  bool search = false;
  @override
  Widget build(BuildContext context) {
    final provider_object = Provider.of<my_providers>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        // centerTitle: true,
        title: Text(
          provider_object.Forms_name.length > 0 ? "Resently used" : "Templets",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          AnimatedContainer(
              margin: EdgeInsets.all(5),
              width: search ? 300 : 45,
              // height: 10,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(80)),
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
                                a = true;
                                search = false;
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
      drawer: Drawer(
        width: 260,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .where("user Id", isEqualTo: current_user?.uid)
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
                      provider_object.Forms_name.clear();
                      String user_name = snapshot.data!.docs[0]["name"];

                      return Text(user_name);
                    }
                    return SizedBox();
                  }),
              accountEmail: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .where("user Id", isEqualTo: current_user?.uid)
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
                      provider_object.Forms_name.clear();
                      String user_email = snapshot.data!.docs[0]["email"];

                      return Text(
                        user_email,
                        style: TextStyle(fontSize: 15),
                      );
                    }
                    return SizedBox();
                  }),
              currentAccountPicture:
                  Image.asset("lib/assets/images/people.png"),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, blurRadius: 10, offset: Offset(0, 1))
                ],
                // color: Color.fromARGB(255, 4, 31, 54),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(255, 4, 31, 54),
                  ],
                  // transform: GradientRotation(40),
                  // stops: [0.5, 0],
                ),
              ),
            ),
            ListTile(
              minLeadingWidth: 50,
              onTap: () {},
              selected: false,
              enabled: true,
              title: Text("Home"),
              leading: Icon(
                Icons.home,
                size: 25,
              ),
            ),
            ListTile(
              minLeadingWidth: 50,
              onTap: () {},
              selected: false,
              enabled: true,
              title: Text("Filtering"),
              leading: Icon(
                Icons.filter_alt,
                size: 25,
              ),
            ),
            ListTile(
              minLeadingWidth: 50,
              onTap: () {
                setState(() {});
              },
              selected: false,
              enabled: true,
              title: Text("About Us"),
              leading: Icon(
                Icons.adb_outlined,
                size: 25,
              ),
            ),
            ListTile(
              minLeadingWidth: 50,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Are you "),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                FirebaseAuth.instance.signOut();
                                Get.offAll(Login_Page());
                              },
                              child: Text("OK"))
                        ],
                      );
                    });
              },
              selected: false,
              enabled: true,
              title: Text("Log Out"),
              leading: Icon(
                Icons.logout_outlined,
                size: 25,
              ),
            ),
          ],
        ),
      ),
      endDrawer: InkWell(
        onTap: () {
          setState(() {});
        },
      ),
      // backgroundColor: Color.fromARGB(255, 6, 1, 27),
      backgroundColor: Color.fromARGB(255, 1, 11, 27),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {});
        },
        child: Container(
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
                child: Consumer(builder: (context, value, child) {
                  return Column(
                    children: [
                      // ______________________________________________________________________________   ( recently used templets )    ____________________________________________________________________________________
                      Container(
                          height: 150,
                          child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("${current_user?.uid}")
                                  .where("userId", isEqualTo: current_user?.uid)
                                  .snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                  provider_object.Forms_name.clear();
                                  print(
                                      " aa======== ${snapshot.data!.docs.length}");
                                  int length_of_Form_name = int.parse(
                                      snapshot.data!.docs[1]["Length"]);
                                  for (int j = 0;
                                      j < length_of_Form_name;
                                      j++) {
                                    provider_object.add_form_name(
                                        snapshot.data!.docs[1][j.toString()]);

                                    // Form_names.add(
                                    //     snapshot.data!.docs[0][j.toString()]);

                                    // print("${snapshot.data!.docs.length}");
                                    provider_object.add_colors(Colors.white);
                                    // search_results = Form_names;'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                                    print(
                                        "Forms name ==== ${provider_object.Forms_name}");
                                  }
                                  // =================================================================    (add trash from firebase)

                                  Trash.clear();
                                  int length_of_Trash = int.parse(
                                      snapshot.data!.docs[0]["Length"]);
                                  for (int i = 0; i < length_of_Trash; i++) {
                                    Trash.add(
                                        snapshot.data!.docs[0][i.toString()]);
                                  }
                                  print("Trash items= $Trash");

                                  return ListView.builder(
                                    itemExtent: 105,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        // onLongPress: () async {
                                        //   print("l.................");
                                        //   // FirebaseFirestore.instance
                                        //   //     .collection("${current_user?.uid}")
                                        //   //     .doc(Form_names[index])
                                        //   //     .delete();
                                        //   provider_object.replace_color(index);
                                        //   setState(() {});
                                        // },
                                        onTap: () {
                                          // =================================================================

                                          print(
                                              "Empty=====${provider_object.Forms_name.isEmpty}");
                                          // =================================================================
                                          Get.to(
                                            Data_show(
                                              Form_name: a
                                                  ? snapshot.data!.docs[1]
                                                      [index.toString()]
                                                  : search_results[index],
                                            ),
                                            transition: Transition.topLevel,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.easeInOutCubic,
                                            // popGesture: true,
                                            fullscreenDialog: true,
                                          );
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: provider_object.SCC[index],
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 110,
                                                width: 90,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        child: InkWell(
                                                          onTap: () {
                                                            // abc = false;
                                                            // form_name =
                                                            //     provider_object
                                                            //             .Forms_name[
                                                            //         index];

                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return AlertDialog(
                                                                    backgroundColor:
                                                                        Color.fromARGB(
                                                                            255,
                                                                            1,
                                                                            11,
                                                                            27),
                                                                    title: Text(
                                                                      "Delete ${snapshot.data!.docs[1][index.toString()]} ? ",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    content:
                                                                        Text(
                                                                      "Delete ${snapshot.data!.docs[1][index.toString()]} from this device ",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    actions: [
                                                                      TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              context),
                                                                          child:
                                                                              Text("Cancel")),
                                                                      TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            Trash.add(snapshot.data!.docs[1][index.toString()]);
                                                                            // List<String>Temp =[];
                                                                            // int length_of_Form_name = int.parse(snapshot.data!.docs[1]["Length"]);
                                                                            // for (int j = 0;j < length_of_Form_name;j++) {
                                                                            //   Temp.add(snapshot.data!.docs[1][j.toString()]);
                                                                            // }
                                                                            print("Trash ${Trash}");

                                                                            provider_object.Forms_name.removeAt(index);

                                                                            Map<String, String>
                                                                                Map_Form_Names =
                                                                                {};
                                                                            for (int i = 0;
                                                                                i < provider_object.Forms_name.length;
                                                                                i++) {
                                                                              Map_Form_Names[i.toString()] = provider_object.Forms_name[i];
                                                                            }
                                                                            Map_Form_Names["userId"] =
                                                                                current_user!.uid.toString();

                                                                            Map_Form_Names["Length"] =
                                                                                provider_object.Forms_name.length.toString();
                                                                            Map<String, String>
                                                                                map_Trash =
                                                                                {};
                                                                            for (int i = 0;
                                                                                i < Trash.length;
                                                                                i++) {
                                                                              map_Trash[i.toString()] = Trash[i];
                                                                            }
                                                                            map_Trash["userId"] =
                                                                                current_user!.uid.toString();

                                                                            map_Trash["Length"] =
                                                                                Trash.length.toString();

                                                                            FirebaseFirestore.instance.collection("${current_user?.uid}").doc("names").set(Map_Form_Names);
                                                                            FirebaseFirestore.instance.collection("${current_user?.uid}").doc("Trash").set(map_Trash);

                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Text("Delete")),
                                                                    ],
                                                                  );
                                                                });

                                                            // // setState(() {});
                                                          },
                                                          child: Icon(
                                                            Icons.close,
                                                            color: Colors.white,
                                                            shadows: [
                                                              BoxShadow(
                                                                  blurRadius: 3,
                                                                  color: Colors
                                                                      .black)
                                                            ],
                                                          ),
                                                        )),
                                                    Container(
                                                      // color: Colors.black,
                                                      padding: EdgeInsets.only(
                                                          bottom: 50),
                                                      child: Center(
                                                        child: Text(
                                                          a
                                                              ? snapshot.data!
                                                                      .docs[1][
                                                                  index
                                                                      .toString()]
                                                              : search_results[
                                                                  index],
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    2,
                                                                    2,
                                                                    2),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.amber,
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                      top: Radius.circular(20),
                                                      bottom:
                                                          Radius.circular(60),
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black,
                                                        blurRadius: 5,
                                                      )
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    scrollDirection: Axis.horizontal,
                                    itemCount: a
                                        ? int.parse(
                                            snapshot.data!.docs[1]["Length"])
                                        : search_results.length,
                                  );
                                }
                                return Container();
                              })),
                      Divider(
                        color: Colors.white,
                      ),
                      abc ? Delet_form(Name, Trash) : SizedBox(),

                      // abc
                      //     ? SizedBox()
                      // : StreamBuilder(
                      //     stream: FirebaseFirestore.instance
                      //         .collection(current_user!.uid)
                      //         .doc(form_name)
                      //         .collection("User_entries")
                      //         .where("uid", isEqualTo: current_user?.uid)
                      //         .snapshots(),
                      //     builder: (context, snapshot) {
                      //       if (snapshot != null && snapshot.data != null) {
                      //         int length_Doc = snapshot.data!.docs.length;

                      //         for (int i = 0; i < length_Doc; i++) {
                      //           var Do_Id = snapshot.data!.docs[i].id;
                      //           FirebaseFirestore.instance
                      //               .collection(current_user!.uid)
                      //               .doc(form_name)
                      //               .collection("User_entries")
                      //               .doc(Do_Id)
                      //               .delete();
                      //         }
                      //         abc = true;
                      //         // setState(() {});

                      //         // form_name = "";
                      //         return SizedBox();
                      //       }
                      //       return SizedBox();
                      //     },
                      //   ),
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
                                S1(
                                    img: "lib/assets/images/Rent4.png",
                                    name: "Rent")
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
            )),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // ______________________________________________________________________________   ( Floating Button )    ____________________________________________________________________________________
      floatingActionButton: Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: FloatingActionButton.extended(
          onPressed: () {
            // Filds_Names.clear();
            // Text_Filds_Lable.clear();
            // Text_Filds_Hint.clear();
            // Form_Fields.clear();
            Form_name_Controler.text =
                "Form ${(provider_object.Forms_name.length + 1).toString()}";
            // setState(() {});
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

                          // Form_names.insert(0, Form_name_Controler.text);

                          print(provider_object.Forms_name);
                          setState(() {
                            // a++;
                            Dcolor = true;
                          });
                          if (Trash.contains(Form_name_Controler.text.trim())) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    " Error... ",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  content: Text(
                                    'That form here in your trash please remove this form in your trash Can you delete this form on your trash Click on "Delete". ',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                    TextButton(
                                        onPressed: () {
                                          Name =
                                              Form_name_Controler.text.trim();
                                          abc = true;
                                          setState(() {});
                                          Navigator.pop(context);
                                        },
                                        child: Text("Delete"))
                                  ],
                                );
                              },
                            );
                          } else if (Form_name_Controler.text.trim() == "") {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Container(
                                // width: 50,
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                      "Form name can't be empty please enter form name"),
                                ),
                              ),
                              behavior: SnackBarBehavior.fixed,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ));
                          } else if (provider_object.Forms_name.contains(
                              Form_name_Controler.text.trim())) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Container(
                                // width: 50,
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                      "Form name is already here in your form list please change your form name then continu your build form."),
                                ),
                              ),
                              behavior: SnackBarBehavior.fixed,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ));
                          } else {
                            Get.off(New_Form(
                              Form_name: Form_name_Controler.text.trim(),
                              All_Forms_Names: provider_object.Forms_name,
                              update: true,
                              // Filds_Name: Filds_Names,
                            ));
                          }
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        )),
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
