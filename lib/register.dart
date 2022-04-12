import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  // @override
  // _RegisterState createState() => _RegisterState();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyStatefulWidget(),
      ),
    );
  }

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool visible = false;

  // Getting value from TextField widget.
  final shopnameController = TextEditingController();
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();

  Future userRegistration() async {
    // Getting value from Controller
    String shopname = shopnameController.text;
    String fname = fnameController.text;
    String lname = fnameController.text;

    // SERVER API URL
    // https://couponkml.000webhostapp.com/
    var url = Uri.parse('https://couponkml.000webhostapp.com/register.php');

    // Store all data with Param Name.
    var data = {'shopname': shopname, 'fname': fname, 'lname': lname};
    // var data = {'shopname': shopname, 'fname': fname, 'lname' : lname};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // color: Colors.blueAccent,
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ]),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      //Login Text
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Signup",
                        style: Theme.of(context).textTheme.headline2,
                      ),

                      //sopname
                      SizedBox(
                        height: 20,
                      ),
                      new TextFormField(
                        keyboardType: TextInputType.text,
                        controller: shopnameController,
                        // validator: (input) => input.length < 3
                        //     ? "Password should be more than 3 characters"
                        //     : null,
                        // obscureText: hidePassword,
                        decoration: new InputDecoration(
                          hintText: "  Shop Name",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.2),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ),

                      // Container(
                      //     width: 280,
                      //     padding: EdgeInsets.all(10.0),
                      //     child: TextField(
                      //       controller: nameController,
                      //       autocorrect: true,
                      //       decoration: InputDecoration(hintText: 'Enter Your Name Here'),
                      //     )
                      // ),

                      //fname
                      SizedBox(
                        height: 20,
                      ),
                      new TextFormField(
                        keyboardType: TextInputType.text,
                        controller: fnameController,
                        decoration: new InputDecoration(
                          // hintText: "Last Name",
                          hintText: "  First Name",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.2),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ),

                      // Container(
                      //     width: 280,
                      //     padding: EdgeInsets.all(10.0),
                      //     child: TextField(
                      //       controller: emailController,
                      //       autocorrect: true,
                      //       decoration: InputDecoration(hintText: 'Enter Your Email Here'),
                      //     )
                      // ),

                      //lname
                      SizedBox(
                        height: 20,
                      ),
                      new TextFormField(
                        keyboardType: TextInputType.text,
                        controller: lnameController,
                        decoration: new InputDecoration(
                          hintText: "  Last Name",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.2),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ),

                      //signup Button
                      SizedBox(
                        height: 25,
                      ),
                      FlatButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 80,
                        ),
                        onPressed: userRegistration,
                        child: Text(
                          "Signup",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Theme.of(context).accentColor,
                        shape: StadiumBorder(),
                      ),

                      Visibility(
                          visible: visible,
                          child: Container(
                              margin: EdgeInsets.only(bottom: 30),
                              child: CircularProgressIndicator())),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
