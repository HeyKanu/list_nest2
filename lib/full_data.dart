import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:list_nest2/show_form.dart';

class full_Data extends StatelessWidget {
  List? lebals = <String>[];
  List? User_Data = <String>[];
  String? Doc_Id;
  String? Form_Name;

  full_Data({this.lebals, this.User_Data, this.Doc_Id, this.Form_Name});

  @override
  Widget build(BuildContext context) {
    bool update = false;
    User? current_user = FirebaseAuth.instance.currentUser;
    return Container(
      // padding: EdgeInsets.only(top: 150),
      width: double.infinity,
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
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(Doc_Id.toString()),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(
                      Show_my_form(
                        Form_Name: Form_Name,
                        Doc_Id: Doc_Id,
                        update: update = true,
                        User_Data: User_Data,
                      ),
                    );
                  },
                  icon: Icon(Icons.edit))
            ],
            // forceMaterialTransparency: true,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
          ),
          body: ListView.builder(
            padding: EdgeInsets.only(top: 20),
            itemCount: User_Data?.length,
            itemBuilder: (context, index) {
              return Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.horizontal(
                        end: Radius.circular(5),
                        start: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      lebals![index],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.blueAccent),
                    )),
                    height: 45,
                    width: 150,
                    // color: Colors.white,
                  ),
                  Container(
                    height: 60,
                    width: 150,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(144, 255, 255, 255),
                        borderRadius: BorderRadiusDirectional.horizontal(
                            end: Radius.circular(20),
                            start: Radius.circular(5))),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(3),
                        // margin: EdgeInsets.all(2),

                        child: Center(
                            child: Text(
                          User_Data![index],
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500),
                        )),
                        // color: Colors.white,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(144, 255, 255, 255),
                            borderRadius: BorderRadiusDirectional.horizontal(
                                end: Radius.circular(20),
                                start: Radius.circular(5))),
                        height: 50,
                        width: 150,
                      ),
                    ),
                  ),
                ],
              ));
            },
          )),
    );
  }
}
