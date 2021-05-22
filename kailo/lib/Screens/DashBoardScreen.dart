import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kailo/utils/PostItem.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: 11,
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
                  child: Text("Hi! Dev",
                      style: GoogleFonts.roboto(
                          fontSize: 40,
                          letterSpacing: 4,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            );
          }
          index -= 1;
          return PostItem(
            content: "A VeryGood Day",
            feeling: "Happy",
            time: DateTime.now(),
            likes: 20,
          );
        },
      ),
    ));
  }
}
