import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/postArguments.dart';

class ProfilePostTile extends StatefulWidget {
  final String name;
  final String id;

  ProfilePostTile(this.name, this.id);

  @override
  _ProfilePostTileState createState() => _ProfilePostTileState();
}

class _ProfilePostTileState extends State<ProfilePostTile> {
  @override
  Widget build(BuildContext context) {
    print("name: " + widget.name);
    print("id: " + widget.id);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/profile_post_view',
          arguments: PostArguments(widget.name, widget.id)
        );
      },
      //TODO: add preview image to post, so you can display this here
      child: Image(image: AssetImage('assets/hubba.jpg'), height: MediaQuery.of(context).size.width / 3, width: MediaQuery.of(context).size.width / 3,),
    );
  }
}
