import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kailo/utils/constants.dart';

class FeedCard extends StatefulWidget {
  String content;
  String feeling;
  DateTime time;
  int likes;
  String title;
  String uid;

  FeedCard({
    this.content,
    this.feeling,
    this.time,
    this.likes,
    this.title,
    this.uid,
  });

  @override
  _FeedCardState createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  String name = null;
  String profilePhoto = null;
  bool isLoading = false;

  void increaseLikes() {
    FirebaseFirestore.instance.collection("feed").doc(widget.uid);
  }

  void createName() async {
    this.setState(() {
      isLoading = true;
    });
    var data = await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.uid)
        .get();
    this.setState(() {
      name = data.data()["name"];
      profilePhoto = data.data()["profile_photo"];
      isLoading = false;
    });
  }

  @override
  void initState() {
    createName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 6 / 3,
      child: GestureDetector(
        onDoubleTap: () {},
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [
                        0.1,
                        .8,
                      ],
                      colors: [
                        Color(0x3136d1dc),
                        Color(0x255b86e5),
                      ]),
                ),
                margin: const EdgeInsets.all(4.0),
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                Text(
                                  widget.title,
                                  style: ktextStyle(),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 16.0),
                                Text(widget.content,
                                    style: ktextStyle()
                                        .copyWith(fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                        )
                      ]),
                    ),
                    Divider(color: Colors.red),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: profilePhoto != null
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(profilePhoto),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.grey,
                                ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(name),
                                SizedBox(height: 2.0),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.heart),
                              SizedBox(height: 2.0),
                              Text(
                                widget.likes.toString(),
                              ),
                            ],
                          ),
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
