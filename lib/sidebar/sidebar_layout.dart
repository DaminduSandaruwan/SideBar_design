import 'package:flutter/material.dart';
import 'package:sidebar_design/pages/homepage.dart';
import 'package:sidebar_design/sidebar/sidebar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          HomePage(),
          SideBar()
        ],
      ),
    );
  }
}