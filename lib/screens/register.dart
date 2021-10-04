import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color(0xff6762F3),
        elevation: 0,
        title: Text(
          "Register",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                child: Image.asset("images/register.png")),
            Container(
              padding: EdgeInsets.only(left: 17),
              child: Column(
                children: [
                  Form(
                      child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Enter Name",
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  )),
                  Form(
                      child: TextField(
                    obscureText: true,
                    // controller: password,
                    decoration: InputDecoration(
                        hintText: "Enter Email",
                        labelText: "Email",
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  )),
                  Form(
                      child: TextField(
                    obscureText: true,
                    // controller: password,
                    decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  )),
                  Form(
                      child: TextField(
                    obscureText: true,
                    // controller: password,
                    decoration: InputDecoration(
                        labelText: "Confirm Password",
                        hintText: "Enter Password",
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  )),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (_) => Homescreen()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 125,
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff6762F3)
                    // color: Colors.deepPurple,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
