import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttermain/screens/loginscreen.dart';
import 'package:fluttermain/screens/homescreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Registrationscreen extends StatefulWidget {
  @override
  _RegistrationscreenState createState() => _RegistrationscreenState();
}

class _RegistrationscreenState extends State<Registrationscreen> {
  String _email;
  var _password;
  bool isloding = false;
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(
          "Registration screen",
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
                        border: OutlineInputBorder(),
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
                              border: OutlineInputBorder(),
                              hintText: "Enter Password",
                              labelText: "Password"),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              signup();
                            },
                            child: Text("Rigistor")),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Loginscreen()));
                            },
                            child: Text(
                              "Login here",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        )
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
          .createUserWithEmailAndPassword(email: _email, password: _password)
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
