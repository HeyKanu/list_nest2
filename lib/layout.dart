// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  // List<String> columns_data = [];
  List<DataColumn> my_columns = [DataColumn(label: Text("str"))];
  List<DataRow> my_row = [];
  void add_column(String str) {
    my_columns.add(DataColumn(label: Text(str)));
  }

  var s = false;
  void add_row() {
    my_row.add(DataRow(
      cells: [
        DataCell(Text("1cbcb")),
        DataCell(Text("2cbcbcb")),
        DataCell(Text("3cbcbc")),
        DataCell(Text("4cbcbcb")),
        DataCell(Text("6cbcbcb")),
        DataCell(Text("7cbcbcbc")),
        DataCell(Text("5cbvcbcbc")),
        DataCell(Text("5cbvccvcc")),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color.fromARGB(255, 191, 247, 113),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: my_columns,
            rows: my_row,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // add_column("Name");
            add_row();
            setState(() {});
          },
          label: Icon(Icons.add)),
    );
  }
}
