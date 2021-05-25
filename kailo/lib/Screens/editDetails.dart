import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kailo/Screens/home_screen.dart';
import 'package:kailo/Screens/userSettings.dart';
import 'package:kailo/utils/constants.dart';

class EditUserSettings extends StatefulWidget {
  @override
  _EditUserSettingsState createState() => _EditUserSettingsState();
}

class _EditUserSettingsState extends State<EditUserSettings> {
  TextEditingController dateOfbirthController = new TextEditingController();
  TextEditingController bioController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  Gender selectedGenderType;
  Color selectedGenderButtonColor = Colors.orange;
  Color unSelectedGenderButtonColor = Colors.transparent;
  int maxLines = 5;
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
                controller: nameController,
                decoration: ktextFieldDecoration("Alice Stark"),
              ),
              SizedBox(height: 30.0),
              Text(
                "Date Of Birth",
                style: ktextStyle().copyWith(
                    fontWeight: FontWeight.w500, color: Colors.black87),
              ),
              TextFormField(
                controller: dateOfbirthController,
                decoration: ktextFieldDecoration("11-01-2001")
                    .copyWith(hintText: "Choose a date"),
                onTap: () async {
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(new FocusNode());

                  date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));

                  setState(() {
                    if (date != null) {
                      dateOfbirthController.text = date.toString();
                    }
                  });
                },
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
                        onTap: () {
                          setState(() {
                            selectedGenderType = Gender.male;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedGenderType == Gender.male
                                ? selectedGenderButtonColor
                                : unSelectedGenderButtonColor,
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
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGenderType = Gender.female;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedGenderType == Gender.female
                                ? selectedGenderButtonColor
                                : unSelectedGenderButtonColor,
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
                      Navigator.pop(context);
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
