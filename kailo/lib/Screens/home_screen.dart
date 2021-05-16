import 'package:flutter/material.dart';

import 'package:kailo/resources/authentication.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FlatButton(
        child: Text("Logout"),
        onPressed: () => signOutUser().then((value) => Navigator.pop(context)),
      ),
    ));
  }
}
