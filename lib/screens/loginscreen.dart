import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttermain/screens/homescreen.dart';
import 'package:fluttermain/screens/registatonscreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Loginscreen extends StatefulWidget {
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  String _email = "dfd";
  var _password;
  bool isloding = false;
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(
          "Login screen",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 300,
            width: double.infinity,
            // color: Colors.amber,
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (item) {
                      return item.contains("@") ? null : "enter valid email";
                    },
                    onChanged: (item) {
                      setState(() {
                        _email = item;
                      });
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Enter Email",
                        labelText: "Email"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          validator: (item) {
                            return item.length > 6
                                ? null
                                : "Password must be 6 caractors";
                          },
                          onChanged: (item) {
                            setState(() {
                              _password = item;
                            });
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.visibility_off),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Enter Password",
                              labelText: "Password"),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              signup();
                            },
                            child: Text("Login")),
                        Container(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Registrationscreen()),
                                );
                              },
                              child: Text(
                                "registor here",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signup() {
    if (_formkey.currentState.validate()) {
      setState(() {
        isloding = true;
      });
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password)
          .then((user) {
        setState(() {
          isloding = false;
        });
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Mainscreen()),
            (route) => false);
        Fluttertoast.showToast(msg: "you are successfully login");
      }).catchError(
        (onError) {
          setState(() {
            isloding = false;
          });
          Fluttertoast.showToast(msg: "error" + onError.toString());
        },
      );
    }
  }
}
