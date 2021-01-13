import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/main.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final double _prefferedHeig = 100.0;

  final String title;

  CustomAppBar(this.title);


  //TODO: Use Navigator Routes to change view because of beacon shit
  void navigateHomeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _prefferedHeig,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.grey[700],
            Colors.grey,
          ],
        ),
      ),
      child: Row(
        children: [
          IconButton(
              icon: RotatedBox(
                quarterTurns: 2,
                child: Icon(Icons.subdirectory_arrow_right, size: 30,),
              ),
              onPressed: () => navigateHomeScreen(context)),

          Text(title, style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeig);

  @override
  Widget get child => throw UnimplementedError();
}
