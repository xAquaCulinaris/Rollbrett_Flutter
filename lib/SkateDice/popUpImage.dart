import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopUpImage extends StatelessWidget {
  final String picture;

  PopUpImage(this.picture);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(picture),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
