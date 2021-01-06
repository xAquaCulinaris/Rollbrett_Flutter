import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkateDiceAddPlayer extends StatefulWidget {
  @override
  _SkateDiceAddPlayerState createState() => _SkateDiceAddPlayerState();
}


class _SkateDiceAddPlayerState extends State<SkateDiceAddPlayer> {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: Scaffold(
       appBar: AppBar(
         title: Text("Skate Dice add Players"),
       ),
       body: Text("Add players"),
     ),
   );
  }

}