import 'package:flutter/material.dart';
import 'package:kailo/utils/radial_progress.dart';

class ResultsPage extends StatefulWidget {
  ResultsPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent[400],
        shape: CustomShapeBorder(),
        leading: Icon(Icons.arrow_back),
        title: Text(
          "STRESS LEVEL",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                Colors.white,
                Colors.grey,
              ],
                  stops: [
                0.0,
                1.0
              ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  RadialProgress(),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: 90.0,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border(left: BorderSide()),
                      // gradient: new LinearGradient(
                      //   colors: [
                      //     Colors.white,
                      //     Colors.grey,
                      //   ],
                      //   stops: [0.0, 1.0],
                      //   begin: FractionalOffset.topCenter,
                      //   end: FractionalOffset.bottomCenter,
                      //   tileMode: TileMode.repeated
                      // ),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 340.0,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border(left: BorderSide()),
                      // gradient: new LinearGradient(
                      //   colors: [
                      //     Colors.white,
                      //     Colors.grey,
                      //   ],
                      //   stops: [0.0, 1.0],
                      //   begin: FractionalOffset.topCenter,
                      //   end: FractionalOffset.bottomCenter,
                      //   tileMode: TileMode.repeated
                      // ),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    final double innerCircleRadius = 45.0;
    double heights = 130;

    Path path = Path();

    path.lineTo(0, heights);
    path.quadraticBezierTo(rect.width / 2 - (innerCircleRadius / 2) - 30,
        heights + 15, rect.width / 2 - 75, heights + 50);
    path.cubicTo(
        rect.width / 2 - 40,
        heights + innerCircleRadius - 40,
        rect.width / 2 + 40,
        heights + innerCircleRadius - 40,
        rect.width / 2 + 75,
        heights + 50);
    path.quadraticBezierTo(rect.width / 2 + (innerCircleRadius / 2) + 30,
        heights + 15, rect.width, heights);
    path.lineTo(rect.width, 0.0);
    path.close();

    return path;
  }
}
