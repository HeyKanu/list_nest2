// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  Layout({super.key});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 247, 113),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        // height: 550,
        // width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [R1(), S1()],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                S1(),
                R1(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [R1(), S1()],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                S1(),
                R1(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

Widget R1() {
  return Container(
    height: 150,
    width: 300,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
  );
}

Widget S1() {
  return Container(
    height: 150,
    width: 100,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
  );
}
