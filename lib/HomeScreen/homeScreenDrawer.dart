import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/firebase/authService.dart';

import 'homeScreenDrawerButton.dart';

class HomeScreenDrawer extends StatelessWidget {
  final AuthService _auth = AuthService();

  void editProfileButton(BuildContext context) {
    Navigator.of(context).pushNamed('/edit_profile_view');
  }

  void logOutButton(BuildContext context) async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Text("Settings"),
          ),
          DrawerButton(Icons.account_circle, "Edit", editProfileButton, context),
          DrawerButton(Icons.logout, "Logout", logOutButton, context)
        ],
      ),
    );
  }
}
