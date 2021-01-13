import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/customAppBar.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Course Preview"),
      body: Center(
        child: Text("ERROR VIEW"),
      ),
    );
  }
}
