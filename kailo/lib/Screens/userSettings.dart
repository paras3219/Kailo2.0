import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kailo/Screens/editDetails.dart';
import 'package:kailo/Screens/viewUserSettings.dart';
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
                margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
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
              physics: NeverScrollableScrollPhysics(),
              controller: _userSettingsPageController,
              children: [ViewUserSettings(), MyHealth()],
            ),
          ),
        ],
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
