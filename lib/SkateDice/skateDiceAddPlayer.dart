import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/skateDicePlayer.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/emailField.dart';

class SkateDiceAddPlayer extends StatefulWidget {
  @override
  _SkateDiceAddPlayerState createState() => _SkateDiceAddPlayerState();
}

class _SkateDiceAddPlayerState extends State<SkateDiceAddPlayer> {
  List<SkateDicePlayer> players = [];

  String name;

  void setPlayerName(String name) {
    this.name = name;
  }

  void addPlayer() {
    if (name == "" || name == null) {
      print("name cant be empty");
    } else {
      setState(() {
        players.add(SkateDicePlayer(name));
      });

    }
  }

  void removePlayer(String name) {
    for (SkateDicePlayer player in players) {
      if (player.name == name) {
        setState(() {
          players.remove(player);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      primaryColor: Colors.grey,
      accentColor: Colors.grey[900],
    ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Skate Dice add Players"),
        ),
        body: Padding(
          padding: EdgeInsets.all(40),
          child: //Text("asd"),

          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: EmailField(name, setPlayerName, "Add Player", Icons.person_add),
                  ),
                  IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: addPlayer)
                ],
              ),
             players.length != 0 ?
             ListView.builder(
                itemCount: players.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Text("Player " + (index+1).toString() + ": " +  players[index].name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),);
                },
              ) : Text("No players added"),
            ],
          ),
        ),
      ),
    );
  }
}
