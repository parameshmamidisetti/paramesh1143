import 'package:flutter/material.dart';
import 'package:fluttermain/screens/homescreen.dart';
import 'package:fluttermain/screens/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset("images/image1.png"),
            SizedBox(
              height: 30,
            ),
            /////// Email text field
            Container(
              padding: EdgeInsets.only(left: 18),
              child: Form(
                  child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: "Enter Email",
                  labelText: "Email",
                ),
              )),
            ),
            SizedBox(
              height: 20,
            ),
            /////// password text field
            Container(
              padding: EdgeInsets.only(left: 18),
              child: Form(
                  child: TextField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Homescreen()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 45,
                width: 120,
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff6762F3)
                    // color: Colors.deepPurple,
                    ),
              ),
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                "I don't have an account ?",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Register()));
                },
                child: Text(
                  " Register here    ",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff6762F3),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )
            ]),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.only(left: 32),
                // color: Colors.amber,
                alignment: Alignment.bottomLeft,
                height: 170,
                child: Row(
                  children: [
                    Text(
                      "Login with   ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6762F3),
                        //
                      ),
                    ),
                    Container(
                        height: 55,
                        width: 55,
                        child: Image.asset("images/google1.png")),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        height: 60,
                        width: 60,
                        child: Image.asset("images/fb.png")),
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
