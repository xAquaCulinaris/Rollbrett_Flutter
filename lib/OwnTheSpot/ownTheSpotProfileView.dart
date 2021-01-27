import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/user.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/profilePostTile.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/loading.dart';
import 'package:rollbrett_rottweil/firebase/fireStorageService.dart';
import 'package:rollbrett_rottweil/firebase/userServiceTest.dart';

class OwnTheSpotProfileView extends StatefulWidget {
  final String uid;

  OwnTheSpotProfileView(this.uid);

  @override
  _OwnTheSpotProfileViewState createState() => _OwnTheSpotProfileViewState();
}

class _OwnTheSpotProfileViewState extends State<OwnTheSpotProfileView> {
  User user;
  String profilePicture;
  final List<String> posts = [];

  @override
  void initState() {
    _getUser(widget.uid);
    _getImage();
    super.initState();
  }

  void _getUser(String uid) async {
    await UserServiceTest.getUser(uid).then((value) {
      if (mounted)
        setState(() {
          user = value;
        });
    });
  }

  void _getImage() async {
    print("uid: " + widget.uid);
    await FireStorageService.getImageFromUID(widget.uid).then((value) {
      if (mounted) {
        setState(() {
          profilePicture = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return user != null
        ? Container(
            child: Column(
              children: [
                Text(user.name),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: MediaQuery.of(context).size.width * 0.105,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.1,
                    //TODO: fix error loading image
                    backgroundImage: NetworkImage(profilePicture),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width ,
                  width: MediaQuery.of(context).size.width,

                  //TODO: fix displaying (dynamiclay and multiple rows)
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ProfilePostTile(user.name, '4af623bc-133f-4525-be0f-acec62e824ba');
                      /*  return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return ProfilePostTile();
                            });*/
                      }),
                ),
              ],
            ),
          )
        : Loading();
  }
}
