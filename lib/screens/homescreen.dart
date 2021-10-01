import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttermain/screens/addimage.dart';
import 'package:fluttermain/screens/registatonscreen.dart';

class Mainscreen extends StatefulWidget {
  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => Registrationscreen()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              )),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
        title: Text(
          "MoreBrands",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: CircleAvatar()),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logut"),
              onTap: () {
                dailog(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Addimage()));
        },
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  dailog(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Are you sure"),
      content: Text("Logout From This App"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("No")),
        TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => Registrationscreen()),
                    (route) => false);
              });
            },
            child: Text("Yes")),
      ],
    );
    showDialog(
        context: context,
        // ignore: non_constant_identifier_names
        builder: (BuildContext) {
          return alert;
        });
  }
}
