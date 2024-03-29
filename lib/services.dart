import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

User? current_user = FirebaseAuth.instance.currentUser;

Sign_up_service(
  String user_name,
  String user_email,
  String user_phone_no,
  String user_password,
) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
        email: user_email,
        password: user_password,
      )
      .then((value) => {print("connect")});
  await FirebaseFirestore.instance
      .collection("users")
      .doc(current_user?.uid)
      .set({
    "name": user_name,
    "email": user_email,
    "phone No": user_phone_no,
    "user Id": current_user?.uid,
    "password": user_password
  }).then((value) => {print("user Id : ${current_user?.uid}")});
}
