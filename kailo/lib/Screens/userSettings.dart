import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kailo/Screens/editDetails.dart';
import 'package:kailo/utils/chart.dart';
import 'package:kailo/utils/constants.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  userSettingsOrHealth selectedSettingType = userSettingsOrHealth.profile;
  PageController _userSettingsPageController = new PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                padding: EdgeInsets.all(3.0),
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _userSettingsPageController.animateToPage(0,
                              duration: Duration(milliseconds: 250),
                              curve: Curves.bounceInOut);
                          selectedSettingType = userSettingsOrHealth.profile;
                        });
                      },
                      child: Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 14),
                          width: MediaQuery.of(context).size.width / 2.3,
                          decoration: BoxDecoration(
                              color: selectedSettingType ==
                                      userSettingsOrHealth.profile
                                  ? Colors.deepPurple.shade800
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50.0)),
                          child: Center(
                            child: Text(
                              'Profile',
                              style: ktextStyle().copyWith(
                                  color: selectedSettingType ==
                                          userSettingsOrHealth.profile
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _userSettingsPageController.animateToPage(1,
                              duration: Duration(milliseconds: 250),
                              curve: Curves.bounceInOut);
                          selectedSettingType = userSettingsOrHealth.health;
                        });
                      },
                      child: Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.3,
                          decoration: BoxDecoration(
                              color: selectedSettingType ==
                                      userSettingsOrHealth.health
                                  ? Colors.deepPurple.shade800
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50.0)),
                          child: Center(
                              child: Text(
                            'My Health',
                            style: ktextStyle().copyWith(
                                color: selectedSettingType ==
                                        userSettingsOrHealth.health
                                    ? Colors.white
                                    : Colors.black),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _userSettingsPageController,
              children: [ViewUserSettings(), MyHealth()],
            ),
          ),
        ],
      ),
    );
  }
}

class ViewUserSettings extends StatefulWidget {
  @override
  _ViewUserSettingsState createState() => _ViewUserSettingsState();
}

class _ViewUserSettingsState extends State<ViewUserSettings> {
  final maxLines = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
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
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 5.0)
                      ],
                    ),
                    child: Center(
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/WelcomeBack.jpg",
                          fit: BoxFit.cover,
                          height: 115,
                          width: 115,
                        ),
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
                showCursor: false,
                readOnly: true,
                decoration: ktextFieldDecoration("Alice Stark"),
              ),
              SizedBox(height: 30.0),
              Text(
                "Date Of Birth",
                style: ktextStyle().copyWith(
                    fontWeight: FontWeight.w500, color: Colors.black87),
              ),
              TextFormField(
                showCursor: false,
                readOnly: true,
                decoration: ktextFieldDecoration("11-01-2001")
                    .copyWith(hintText: "Choose a date"),
              ),
              SizedBox(height: 30.0),
              Text(
                "Gender",
                style: ktextStyle().copyWith(
                    fontWeight: FontWeight.w500, color: Colors.black87),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.black45),
                          ),
                          height: 60.0,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.male),
                                Text(
                                  "Male",
                                  style: ktextStyle().copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.black45),
                        ),
                        height: 60.0,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.female),
                              Text(
                                "Female",
                                style: ktextStyle().copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
                  showCursor: false,
                  readOnly: true,
                  maxLines: maxLines,
                  decoration: ktextFieldDecoration("").copyWith(
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditUserSettings()));
                      });
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
                          "Edit My Profile",
                          style: ktextStyle().copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHealth extends StatefulWidget {
  @override
  _MyHealthState createState() => _MyHealthState();
}

class _MyHealthState extends State<MyHealth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Your Health History",
                  style: ktextStyle().copyWith(fontSize: 20.0),
                ),
              ),
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: MyHealthChart(),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                      height: 100.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 3)
                          ]),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
