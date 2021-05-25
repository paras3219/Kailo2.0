import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostItem extends StatefulWidget {
  String content;
  String feeling;
  int likes;
  DateTime time;
  String title;

  PostItem({
    this.content,
    this.feeling,
    this.likes,
    this.time,
    this.title,
  });

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  String statusOfPostItem;
  List<String> statusList = ["Public", "Private"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 10,
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 8.0)],
          color: Colors.white70,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 90.0,
            color: Colors.deepPurple.shade600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.time.toString().split(" ")[1],
                  style: TextStyle(
                      fontSize: 10.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.white70),
                ),
                Text(
                  "May",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white70),
                ),
                DropdownButton(
                  iconDisabledColor: Colors.white,
                  dropdownColor: Colors.black,
                  hint: Text(
                    "Private",
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.w400),
                  ),
                  items: statusList.map((itemsName) {
                    return DropdownMenuItem(
                        value: itemsName,
                        child: Text(
                          itemsName,
                          style: TextStyle(color: Colors.white70),
                        ));
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      statusOfPostItem = newValue;
                    });
                  },
                  value: statusOfPostItem,
                )
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Center(
                      child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )),
                  //color: Colors.yellow,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Center(
                    child: Text(
                      widget.content,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.greenAccent, blurRadius: 5.0)
                          ],
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
