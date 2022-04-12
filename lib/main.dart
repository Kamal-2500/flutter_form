import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

enum Gender { male, female }

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text("A+"), value: "A+"),
    const DropdownMenuItem(child: Text("A-"), value: "A-"),
    const DropdownMenuItem(child: Text("B+"), value: "B+"),
    const DropdownMenuItem(child: Text("B-"), value: "B-"),
    const DropdownMenuItem(child: Text("O+"), value: "O+"),
    const DropdownMenuItem(child: Text("O-"), value: "O-"),
    const DropdownMenuItem(child: Text("AB+"), value: "AB+"),
    const DropdownMenuItem(child: Text("AB-"), value: "AB-")
  ];
  return menuItems;
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController dateOfJoiningController = TextEditingController();
  DateTime currentDate = DateTime.now();
  Gender? _gender = Gender.male;
  String? _bloodGroup;

  Future getData() async {
    // print("Inside Function");
    // var url = Uri.parse('http://localhost:5000');
    // var response = await http.get(url);
    // var message = jsonDecode(response.body);
    // print(message);

    // var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    // final response = await http.get(url);
    // var responseData = json.decode(response.body);
    // print(responseData);

    // var url = Uri.parse('http://192.168.1.114:5000');
    var url = Uri.parse('http://localhost:5000');
    final response = await http.get(url, headers: {
      "Access-Control-Allow-Origin": "*",
      "Accept": "application/json"
    });

    // String firstName = firstNameController.text;
    // String middleName = middleNameController.text;
    // String lastName = lastNameController.text;
    // String bloodGroup = _bloodGroup.toString();
    // String dateOfBirth = dateOfBirthController.text;
    // String dateOfJoining = dateOfJoiningController.text;
    // String gender = _gender.toString().split('.')[1];

    // var data = {
    //   'firstName': firstName,
    //   'middleName': middleName,
    //   'lastName': lastName,
    //   'bloodGroup': bloodGroup,
    //   'dateOfBirth': dateOfBirth,
    //   'dateOfJoining': dateOfJoining,
    //   'gender': gender
    // };
    // var response = await http.post(url, body: json.encode(data));
    // var response = await http.post(url, body: json.encode(data));
    var message = jsonDecode(response.body);
    print(message);
  }

  Future<void> dateOfBirth(BuildContext context) async {
    final DateTime? selectDOB = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (selectDOB != null && selectDOB != currentDate) {
      setState(() {
        var selectedDOB = selectDOB.toString();
        dateOfBirthController.text = selectedDOB.split(' ')[0];
      });
    }
  }

  Future<void> dateOfJoining(BuildContext context) async {
    final DateTime? selectDOJ = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (selectDOJ != null && selectDOJ != currentDate) {
      setState(() {
        var selectedDOJ = selectDOJ.toString();
        dateOfJoiningController.text = selectedDOJ.split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            //first name
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                ),
              ),
            ),

            //middle name
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                controller: middleNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Middle name',
                ),
              ),
            ),

            //last name
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last name',
                ),
              ),
            ),

            //blood group
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              // margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ButtonTheme(
                alignedDropdown: false,
                child: DropdownButtonFormField(
                    focusColor: Colors.white10,
                    elevation: 1,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Blood group'),
                    validator: (value) =>
                        value == null ? "Select a country" : null,
                    value: _bloodGroup,
                    onChanged: (String? newValue) {
                      setState(() {
                        _bloodGroup = newValue!;
                      });
                    },
                    items: dropdownItems),
              ),
            ),

            //dob
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                controller: dateOfBirthController,
                readOnly: true,
                onTap: () => dateOfBirth(context),
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                  labelText: 'DOB',
                ),
              ),
            ),

            //doj
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                controller: dateOfJoiningController,
                readOnly: true,
                onTap: () => dateOfJoining(context),
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                  labelText: 'Joining date',
                ),
              ),
            ),

            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(5),
            //     border: OutlineInputBorder(),
            //     color: Colors.green,
            //   ),
            //   child: DropdownButtonHideUnderline(
            //     child: DropdownButton(
            //       value: selectedValue,
            //       items: dropdownItems,
            //       onChanged: (String? newValue) {
            //         setState(() {
            //           selectedValue = newValue!;
            //         });
            //       },
            //     ),
            //   ),
            // ),

            //gender
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: const Text('Gender :'),
            ),
            Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ListTile(
                          title: const Text('Male'),
                          leading: Radio<Gender>(
                            value: Gender.male,
                            groupValue: _gender,
                            onChanged: (Gender? value) {
                              setState(() {
                                _gender = value;
                              });
                            },
                          )),
                      ListTile(
                        title: const Text('Female'),
                        leading: Radio<Gender>(
                          value: Gender.female,
                          groupValue: _gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 1, 10, 10),
                child: ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    getData();
                    // ignore: avoid_print
                    // print(firstNameController.text +
                    //     " " +
                    //     middleNameController.text +
                    //     " " +
                    //     lastNameController.text +
                    //     " " +
                    //     dateOfBirthController.text +
                    //     " " +
                    //     dateOfJoiningController.text +
                    //     " " +
                    //     _bloodGroup.toString() +
                    //     " " +
                    //     _gender.toString().split('.')[1]);
                  },
                )),
          ],
        ));
  }
}
