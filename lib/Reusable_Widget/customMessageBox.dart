import 'package:flutter/material.dart';

class CustomMessageBox extends StatefulWidget {
  String title;
  String description;
  String buttonText;
  bool navigateHomeScreen;

  CustomMessageBox.fromCustomMessageBox(String title, String description, String buttonText, bool navigateHomeScreen) {
    this.title = title;
    this.description = description;
    this.buttonText = buttonText;
    this.navigateHomeScreen = navigateHomeScreen;
  }

  CustomMessageBox(this.title, this.description, this.buttonText) {
    this.title = title;
    this.description = description;
    this.buttonText = buttonText;
    this.navigateHomeScreen = false;
  }

  @override
  _CustomMessageBoxState createState() => _CustomMessageBoxState();
}

class _CustomMessageBoxState extends State<CustomMessageBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 65, right: 20, bottom: 20),
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(shape: BoxShape.rectangle, color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
            BoxShadow(color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
          ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),
              Text(widget.description, style: TextStyle(fontSize: 14), textAlign: TextAlign.center),
              SizedBox(height: 22),
              Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  onPressed: () {
                    if (widget.navigateHomeScreen)
                      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                    else
                      Navigator.of(context).pop();

                  },
                  child: Text(widget.buttonText, style: TextStyle(fontSize: 18)),
                ),
              )
            ],
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              child: Image.asset('assets/info_icon.png'),
            ),
          ),
        )
      ],
    );
  }
}
