import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Trash_page extends StatefulWidget {
  const Trash_page({super.key});

  @override
  State<Trash_page> createState() => _Trash_pageState();
}

class _Trash_pageState extends State<Trash_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return 
        },
      ),
    );
  }
}
