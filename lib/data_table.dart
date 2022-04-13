// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'empDetails.dart';

void main() => runApp(TableFormat());

class TableFormat extends StatelessWidget {
  // const TableFormat({Key? key}) : super(key: key);

  TableFormat({Key? key}) : super(key: key) {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyStatefulWidget(),
      ),
    );
  }

  Future getData() async {
    var url = Uri.parse('http://localhost:5000');

    final response = await http.get(url, headers: {
      "Access-Control-Allow-Origin": "*",
      "Accept": "application/json"
    });

    var employeeData = json.decode(response.body);
    print(employeeData);
    print(employeeData.runtimeType);
    print(employeeData.length);

    // for (var emp in employeeData) {
    //   print(emp);
    // }

    for (var i = 0; i < employeeData.length; i++) {}
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Future getData() async {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 1, 10, 10),
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Name',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Age',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Role',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Sarah')),
                    DataCell(Text('19')),
                    DataCell(Text('Student')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Janine')),
                    DataCell(Text('43')),
                    DataCell(Text('Professor')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('William')),
                    DataCell(Text('27')),
                    DataCell(Text('Associate Professor')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
