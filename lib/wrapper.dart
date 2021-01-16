import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rollbrett_rottweil/HomeScreen/homeScreen.dart';
import 'package:rollbrett_rottweil/Login/loginView.dart';

import 'Class/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    return user == null ? LoginPage() : HomeScreen();
  }


}
