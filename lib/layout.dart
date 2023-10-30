// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText: Templets_Names[0],
                  filled: true,
                  fillColor: Colors.amber,
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: TextEditingController(
                  text: "name",
                ),
                onChanged: (value) {
                  Templets_Names.replaceRange(0, 1, [value]);
                  print(Templets_Names[0]);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                  fillColor: Colors.amber,
                  border: OutlineInputBorder(),
                ),
              )
            ],
          )),
    );
  }
}
