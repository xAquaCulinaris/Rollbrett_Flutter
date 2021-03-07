import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rollbrett_rottweil/Class/user.dart';
import 'package:rollbrett_rottweil/firebase/authService.dart';
import 'package:rollbrett_rottweil/route_generator.dart';
import 'package:rollbrett_rottweil/wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        primaryColor: Colors.grey,
        accentColor: Colors.grey[900],
      ),
      home: StreamProvider<User>.value(
        value: AuthService().user,
        child: Wrapper(),
        catchError: (_, __) => null,
      ),
    ),
  );
}
