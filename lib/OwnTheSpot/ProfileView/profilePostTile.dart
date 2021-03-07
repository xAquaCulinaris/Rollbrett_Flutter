import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/post.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/ProfileView/postArguments.dart';

class ProfilePostTile extends StatefulWidget {
  final Post post;

  ProfilePostTile(this.post);

  @override
  _ProfilePostTileState createState() => _ProfilePostTileState();
}

class _ProfilePostTileState extends State<ProfilePostTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/profile_post_view', arguments: PostArguments(widget.post));
      },
      child: Image(
        image: NetworkImage(widget.post.thumbnail),
        height: MediaQuery.of(context).size.width / 3,
        width: MediaQuery.of(context).size.width / 3,
      ),
    );
  }
}
