import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kailo/Screens/editDetails.dart';
import 'package:kailo/resources/authentication.dart';

class ViewUserSettings extends StatefulWidget {
  @override
  _ViewUserSettingsState createState() => _ViewUserSettingsState();
}

class _ViewUserSettingsState extends State<ViewUserSettings> {
  String bio;
  String name;
  int age;
  String profilePhoto;
  void createUserProfile() async {
    User user = await getCurrentUser();
    try {
      var data = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();
      this.setState(() {
        name = data.data()["name"];
        bio = data.data()["bio"];
        age = data.data()["age"];
        profilePhoto = data.data()["profile_photo"];
      });
      print(data.data()["profile_photo"]);
    } catch (err) {
      print("profile-----error");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    createUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 14.0),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundImage: profilePhoto == null
                      ? AssetImage('assets/images/profile.png')
                      : NetworkImage(profilePhoto),
                  radius: 70.0,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 500.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Align(
                          heightFactor: 1,
                          alignment: Alignment.center,
                          child: Text(
                            name == null ? "No Name" : name,
                            style: TextStyle(
                              fontSize: 40.0,
                            ),
                          ),
                        ),
                        Align(
                          heightFactor: 6.0,
                          alignment: Alignment.center,
                          child: Text(
                            age == null ? 'Age: No age ' : "Age: ${age}",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Align(
                          heightFactor: 5.0,
                          alignment: Alignment.center,
                          child: ElevatedButton(
                              child: Container(
                                width: 110.0,
                                height: 40.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.edit),
                                    Text('Edit Profile'),
                                  ],
                                ),
                              ),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.purple),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          side: BorderSide(
                                              color: Colors.purple)))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditUserSettings()));
                              }),
                        ),
                        Align(
                          widthFactor: 1.5,
                          heightFactor: 7.5,
                          alignment: Alignment.center,
                          child: Container(
                            child: Text(
                              "Bio",
                              style: TextStyle(
                                fontSize: 35.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(bio == null ? "No Bio" : bio),
                              height: 250.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                ),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
