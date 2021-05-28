import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kailo/models/testModel.dart';
import 'package:kailo/resources/authentication.dart';
import 'package:kailo/utils/constants.dart';
import 'package:kailo/utils/chart.dart';

class MyHealth extends StatefulWidget {
  @override
  _MyHealthState createState() => _MyHealthState();
}

class _MyHealthState extends State<MyHealth> {
  List<TestModel> prevResult = [];
  void resultsHistory() async {
    print(
        "-------------------------------------------------hello--------------------------------------");
    User user = await getCurrentUser();
    setState(() {
      prevResult = [];
    });
    Stream<QuerySnapshot> stream = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('results')
        .snapshots();
    stream.listen((snapshot) {
      snapshot.docs.forEach((element) {
        TestModel test = TestModel.fromMap(element.data());
        this.setState(() {
          prevResult.add(test);
        });
        print("asdfghjhgfdfghgf");
        print(prevResult[0].result);
      });
    });
  }

  @override
  void initState() {
    resultsHistory();
    // TODO: implement initState
    super.initState();
  }

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
              SizedBox(height: 5.0),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: prevResult.length,
                  itemBuilder: (context, index) {
                    TestModel test = prevResult[index];
                    index -= 1;
                    return Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                      height: 100.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          gradient: test.result >= 0 && test.result <= 13
                              ? LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                      Color(0xff380ff72),
                                      Color(0xff57ee8fa),
                                    ])
                              : test.result > 13 && test.result < 27
                                  ? LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      stops: [
                                          0.1,
                                          .8,
                                        ],
                                      colors: [
                                          Color(0xffffdd00),
                                          Color(0xfffbb034),
                                        ])
                                  : LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      stops: [
                                          0.1,
                                          .8,
                                        ],
                                      colors: [
                                          Color(0xfffbd72b),
                                          Color(0xfff9484a),
                                        ]),
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 3)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            test.time.toString().substring(0, 16),
                            style: ktextStyle(),
                          ),
                          Text(
                            test.result.toString()[1] == '.'
                                ? test.result.toString().substring(0, 1) + '/40'
                                : test.result.toString().substring(0, 2) +
                                    '/40',
                            style: ktextStyle(),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
