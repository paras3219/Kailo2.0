import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kailo/utils/constants.dart';

import 'feedCardHelper.dart';

class FeedCard extends StatefulWidget {
  const FeedCard({Key key}) : super(key: key);

  @override
  _FeedCardState createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 6 / 3,
      child: GestureDetector(
        onDoubleTap: (){
          
        },
        child: Container(
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
              _Feed(),
              Divider(color: Colors.red),
              _FeedDetails(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Feed extends StatelessWidget {
  const _Feed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(children: [_FeedTitleAndSummary()]),
    );
  }
}

class _FeedTitleAndSummary extends StatelessWidget {
  const _FeedTitleAndSummary({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String title = DemoValues.postTitle;
    final String summary = DemoValues.postSummary;

    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Text(
              title,
              style: ktextStyle(),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(summary,
                style: ktextStyle().copyWith(fontWeight: FontWeight.w400),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _FeedDetails extends StatelessWidget {
  const _FeedDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _UserImage(),
        _UserName(),
        _likes(),
      ],
    );
  }
}

class _likes extends StatefulWidget {
  @override
  __likesState createState() => __likesState();
}

class __likesState extends State<_likes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.heart),
          SizedBox(height: 2.0),
          Text(
            DemoValues.likes.toString(),
          ),
        ],
      ),
    );
  }
}

class _UserName extends StatelessWidget {
  const _UserName({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(DemoValues.userName, style: ktextStyle()),
            SizedBox(height: 2.0),
          ],
        ),
      ),
    );
  }
}

class _UserImage extends StatelessWidget {
  const _UserImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: CircleAvatar(
        backgroundImage: AssetImage(DemoValues.userImage),
      ),
    );
  }
}
