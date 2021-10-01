import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Addimage extends StatefulWidget {
  @override
  _AddimageState createState() => _AddimageState();
}

class _AddimageState extends State<Addimage> {
  bool isloding = false;
  XFile _imagefile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add image"),
      ),
      body: isloding == true
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // ignore: unnecessary_null_comparison
                _imagefile == null
                    ? Text("no image choosen")
                    : Container(
                        height: 500,
                        child: Image.file(File(_imagefile.path)),
                      ),
                ElevatedButton(
                    onPressed: () {
                      pickimage();
                    },
                    child: Text(
                      "add image ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                ElevatedButton(
                    onPressed: () {
                      uploadimage();
                    },
                    child: Text(" upload image"))
              ],
            ),
    );
  }

  Future pickimage() async {
    ImagePicker _pick = ImagePicker();
    // _pick.pickMultiImage();
    final XFile image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    // ignore: deprecated_member_use
    print(image.path);
    setState(() {
      _imagefile = image;
    });
  }

  uploadimage() async {
    final reference =
        FirebaseStorage.instance.ref().child("new folder").child("jump");
    final upload = reference.putFile(File(_imagefile.path));
  }
}
