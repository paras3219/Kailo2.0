import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  String content;
  String feeling;
  int likes;
  DateTime time;

  PostItem({this.content, this.feeling, this.likes, this.time});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 200,
      decoration: BoxDecoration(
          color: Colors.blueAccent[100],
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [Text(content)],
      ),
    );
  }
}
