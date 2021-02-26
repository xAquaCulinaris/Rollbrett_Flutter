import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/skateDicePlayer.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/customAppBar.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/emailField.dart';
import 'package:rollbrett_rottweil/SkateDice/SkateDiceModelController.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDiceConfig.dart';

class SkateDiceAddPlayer extends StatefulWidget {
  @override
  _SkateDiceAddPlayerState createState() => _SkateDiceAddPlayerState();
}

class _SkateDiceAddPlayerState extends State<SkateDiceAddPlayer> {
  List<SkateDicePlayer> players = [];

  String name;

  void _nextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SkateDiceConfig()),
    );
  }

  void setPlayerName(String name) {
    this.name = name;
  }

  void addPlayer() {
    if (name == "" || name == null) {
      print("name cant be empty");
    } else {
      setState(() {
        players.add(SkateDicePlayer(name));
        SkateDiceModelController.of(context).players.add(SkateDicePlayer(name));
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
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: EmailField(
                    text: name,
                    function: setPlayerName,
                    labelText: "Add Player",
                    icon: Icons.person_add,
                    keyLayout: TextInputType.text),
              ),
              IconButton(
                  icon: Icon(Icons.add_circle_outline), onPressed: addPlayer)
            ],
          ),
          players.length != 0
              ? ListView.builder(
                  itemCount: players.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Text(
                      "Player " +
                          (index + 1).toString() +
                          ": " +
                          players[index].name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    );
                  },
                )
              : Text("No players added"),
          FloatingActionButton(onPressed: () {
            _nextPage();
          }),
        ],
      ),
    );
  }
}
