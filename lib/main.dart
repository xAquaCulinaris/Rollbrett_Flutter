import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Login/loginView.dart';
import 'package:rollbrett_rottweil/route_generator.dart';
import 'package:rollbrett_rottweil/wrapper.dart';

import 'HomeScreen/homeScreen.dart';

void main() {
  bool loggedIn = false;

  runApp(MaterialApp(

    initialRoute: '/',
    onGenerateRoute: RouteGenerator.generateRoute,
    theme: ThemeData(
      primaryColor: Colors.grey,
      accentColor: Colors.grey[900],
    ),
    home: Wrapper(),
  )
  );
}



