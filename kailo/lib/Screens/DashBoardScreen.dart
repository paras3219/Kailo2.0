import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kailo/models/PostModel.dart';
import 'package:kailo/resources/authentication.dart';
import 'package:kailo/utils/PostItem.dart';

import '../utils/PostItem.dart';
import '../utils/constants.dart';
import '../utils/constants.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  String name;
  List<PostModel> posts = [];
  void currentUser() async {
    User curr = await getCurrentUser();
    this.setState(() {
      name = curr.displayName.split(" ")[0];
    });
  }

  void createPostList() async {
    User user = await getCurrentUser();
    Stream<QuerySnapshot> stream = FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .collection("posts")
        .snapshots();
    print("-----------------here-------------------");
    List<PostModel> list = [];
    stream.listen((snapshot) {
      snapshot.docs.forEach((element) {
        PostModel post = PostModel.fromMap(element.data());
        list.add(post);
      });
    });
    this.setState(() {
      posts = list;
    });
    print(posts);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentUser();
    createPostList();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    createPostList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: posts.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0, left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.purpleAccent,
                        backgroundImage: NetworkImage(
                            "https://picsum.photos/id/788/400/800"),
                      ),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.bars),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Text("Hi! ${name} ",
                      style: GoogleFonts.roboto(
                          fontSize: 40,
                          letterSpacing: 4,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            );
          }
          index -= 1;
          PostModel temp = posts[index];
          return PostItem(
            content: temp.content,
            feeling: temp.feeling,
            time: temp.time,
            likes: temp.likes,
            title: temp.title,
          );
        },
      ),
    ));
  }
}
