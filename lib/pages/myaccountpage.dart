import 'package:flutter/material.dart';
import 'package:sidebar_design/block.navigation_bloc/navigation_bloc.dart';

class MyAccountPage extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "My Account Page",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
} 