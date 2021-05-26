import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RadialProgress extends StatefulWidget {
  final double goalCompleted = 0.645;
  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{
  
  AnimationController _radialProgressAnimationController;
  Animation<double> _progressAnimation;
  final Duration fadeInDuration = Duration(milliseconds: 500);
  double progressDegrees = 0;
  double percent = 0;
  int finalans = 0;

  @override
  void initState() {
    super.initState();
    _radialProgressAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _progressAnimation = Tween(begin: 0.0, end: 360.0)
    .animate(CurvedAnimation(parent: _radialProgressAnimationController, curve: Curves.decelerate))..addListener(() { 
      setState(() {
        progressDegrees = widget.goalCompleted * _progressAnimation.value;
        percent = widget.goalCompleted * 100;
        finalans = percent.round();
      });
    });
    _radialProgressAnimationController.forward();
  }

  @override
  void dispose() {
    _radialProgressAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: 200.0,
        width: 200.0,
        padding: EdgeInsets.symmetric(vertical: 60.0),
        child: AnimatedOpacity(
          opacity: 1.0,
          duration: fadeInDuration,
          child: Center(
            child: Column(
              children: [
                Text(
                  '$finalans'+'%',
                  style: TextStyle(fontSize: 50.0, letterSpacing: 1.5),
                ),
                // SizedBox(
                //   height: 4.0,
                // ),
                Container(
                  height: 5.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
                ),
                // SizedBox(
                //   height: 10.0,
                // ),
                // Text(
                //   '1.225',
                //   style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                // ),
                // Text(
                //   'CALORIES BURN',
                //   style: TextStyle(
                //       fontSize: 14.0, color: Colors.blue, letterSpacing: 1.5),
                // ),
              ],
            ),
          ),
        ),
      ),
      painter: RadialPainter(progressDegrees),
    );
  }
}

class RadialPainter extends CustomPainter{
  double progressInDegrees;
  RadialPainter(this.progressInDegrees);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;
    
    Offset center = Offset(size.width/2, size.height/2);
    canvas.drawCircle(center, size.width/2.1, paint);

    Paint progresspaint = Paint()
      ..shader = LinearGradient(colors: [
        Colors.red, Colors.purple, Colors.purpleAccent
      ]).createShader(Rect.fromCircle(center: center, radius:size.width/2.1))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

      canvas.drawArc(Rect.fromCircle(center: center, radius: size.width/2.1), math.radians(-90), 
      math.radians(progressInDegrees), false, progresspaint);
    }

    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
      return true;
  }
}