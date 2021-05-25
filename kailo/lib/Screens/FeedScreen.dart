import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kailo/models/PostModel.dart';
import 'package:kailo/resources/authentication.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<PostModel> feeds = [];
  bool isLoading = false;

  void createFeedList() async {
    this.setState(() {
      feeds = [];
      isLoading = true;
    });
    Stream<QuerySnapshot> stream =
        FirebaseFirestore.instance.collection("feed").snapshots();
    print("-----------------here-------------------");
    stream.listen((snapshot) {
      snapshot.docs.forEach((element) {
        PostModel post = PostModel.fromMap(element.data());
        this.setState(() {
          feeds.add(post);
        });
      });
      print(feeds.length);
    });
    this.setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    createFeedList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 80, left: 20),
            child: Row(
              children: [
                Text(
                  "Feed",
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
