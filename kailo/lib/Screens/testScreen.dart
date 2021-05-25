import 'package:flutter/material.dart';
import 'package:kailo/models/textModel.dart';
import 'package:kailo/utils/add_options.dart';
import 'package:kailo/utils/constants.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  TestScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TestScreen> {
  TestModel testModel = new TestModel();
  double testScore = 0;

  Map<dynamic,dynamic> resultDataMap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 270,
          child: Text(
            'Questions',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  '1. How often have you been upset because of something that happened unexpectedly?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 17,
                  ),
                ),
                AddOption(0, 0),
                SizedBox(
                  height: 10,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Text(
                  '2. How often have you felt that you were unable to control the important things in your life?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 17,
                  ),
                ),
                AddOption(1, 0),
                SizedBox(
                  height: 10,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Text(
                  '3. How often have you felt nervous and stressed?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 17,
                  ),
                ),
                AddOption(2, 0),
                SizedBox(
                  height: 10,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Text(
                  '4. How often have you felt confident about your ability to handle your personal problems?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 17,
                  ),
                ),
                AddOption(3, 0),
                SizedBox(
                  height: 10,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Text(
                  '5. How often have you felt that things were going your way?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 17,
                  ),
                ),
                AddOption(4, 0),
                SizedBox(
                  height: 10,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Text(
                  '6. How often have you found that you could not cope with all the things that you had to do?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 17,
                  ),
                ),
                AddOption(5, 0),
                SizedBox(
                  height: 10,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Text(
                  '7. How often have you been able to control irritations in your life?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 17,
                  ),
                ),
                AddOption(6, 0),
                SizedBox(
                  height: 10,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Text(
                  '8. How often have you felt that you were on top of things?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 17,
                  ),
                ),
                AddOption(7, 0),
                SizedBox(
                  height: 10,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Text(
                  '9. How often have you been angered because of things that happened that were outside of your control?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 17,
                  ),
                ),
                AddOption(8, 0),
                SizedBox(
                  height: 10,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Text(
                  '10. How often have you felt difficulties were piling up so high that you could not overcome them?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 17,
                  ),
                ),
                AddOption(9, 0),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 400.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      for (int i = 0; i < scoreValues.length; i++) {
                        testScore += scoreValues[i];
                      }
                      resultDataMap = {
                        'result':testScore.toString(),
                        'time':DateTime.now(),
                      };
                      testModel.uploadResult(resultDataMap);
                    },
                    child: Text('SUBMIT'),
                  ),
                ),
                SizedBox(height: 100.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
