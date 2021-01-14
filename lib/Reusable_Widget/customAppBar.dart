import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final double _prefferedHeight = 100.0;

  final String title;

  CustomAppBar(this.title);

  void navigateHomeScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: _prefferedHeight,
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
       // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              onPressed: () => navigateHomeScreen(context)),
          Text(title, style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);

  @override
  Widget get child => throw UnimplementedError();
}
