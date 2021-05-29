import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kailo/resources/authentication.dart';
import 'package:kailo/utils/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditUserSettings extends StatefulWidget {
  @override
  _EditUserSettingsState createState() => _EditUserSettingsState();
}

class _EditUserSettingsState extends State<EditUserSettings> {
  final _storage = FirebaseStorage.instance;

  TextEditingController dateOfbirthController = new TextEditingController();
  TextEditingController bioController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  Gender selectedGenderType;
  Color selectedGenderButtonColor = Colors.orange;
  Color unSelectedGenderButtonColor = Colors.transparent;
  int maxLines = 5;
  File _image;
  String imageUrl;
  final picker = ImagePicker();
  _imgFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        uploadToDataBase(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  _imgFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        uploadToDataBase(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  uploadToDataBase(File _image) async {
    var snapShot = await _storage
        .ref()
        .child('folder/images/${DateTime.now()}')
        .putFile(_image);
    var downloadUrl = await snapShot.ref.getDownloadURL();
    setState(() {
      imageUrl = downloadUrl;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void editUserDetails() async {
    User user = await getCurrentUser();
    if (nameController.text != null) {
      FirebaseFirestore.instance.collection("users").doc(user.uid).update({
        "name": nameController.text,
      });
    }
    if (bioController.text != null) {
      FirebaseFirestore.instance.collection("users").doc(user.uid).update({
        "bio": bioController.text,
      });
    }
    if (dateOfbirthController.text != null) {
      FirebaseFirestore.instance.collection("users").doc(user.uid).update({
        "age": int.parse(dateOfbirthController.text),
      });
    }
    if (imageUrl != null) {
      FirebaseFirestore.instance.collection("users").doc(user.uid).update({
        "profile_photo": imageUrl,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80.0,
              ),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: _image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.file(
                              _image,
                              width: 130,
                              height: 130,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(100)),
                            width: 130,
                            height: 130,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        AssetImage('assets/images/profile.png'),
                                    radius: 70.0,
                                  ),
                                ),
                                Icon(
                                  Icons.add_a_photo,
                                  color: Colors.grey[800],
                                ),
                              ],
                            ),
                          ),
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              Text(
                "Name",
                style: ktextStyle().copyWith(
                    fontWeight: FontWeight.w500, color: Colors.black87),
              ),
              TextField(
                controller: nameController,
                decoration: ktextFieldDecoration("Alice Stark"),
              ),
              SizedBox(height: 30.0),
              Text(
                "Age",
                style: ktextStyle().copyWith(
                    fontWeight: FontWeight.w500, color: Colors.black87),
              ),
              TextField(
                controller: dateOfbirthController,
                decoration: ktextFieldDecoration("Enter Age"),
              ),
              SizedBox(height: 30.0),
              Text(
                "Bio",
                style: ktextStyle().copyWith(
                    fontWeight: FontWeight.w500, color: Colors.black87),
              ),
              Container(
                height: maxLines * 24.0,
                child: TextField(
                  controller: bioController,
                  maxLines: maxLines,
                  decoration: ktextFieldDecoration("").copyWith(
                    hintText: "Enter a message",
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      editUserDetails();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade800,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      height: 50.0,
                      width: 150.0,
                      child: Center(
                        child: Text(
                          "Save & Continue",
                          style: ktextStyle().copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
