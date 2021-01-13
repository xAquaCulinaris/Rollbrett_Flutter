import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/obstacle.dart';
import 'package:rollbrett_rottweil/CoursePreview/coursePreview.dart';
import 'package:rollbrett_rottweil/CoursePreview/detailedObstacleView.dart';
import 'package:rollbrett_rottweil/Instagram/instagramTabBar.dart';
import 'package:rollbrett_rottweil/Login/loginView.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDiceAddPlayer.dart';
import 'package:rollbrett_rottweil/ErrorPage/errorPage.dart';
import 'package:rollbrett_rottweil/HomeScreen/homeScreen.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDiceConfig.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDices.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {

      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());

      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case '/course_preview':
        return MaterialPageRoute(builder: (_) => CoursePreview());

      case '/skate_dice':
        return MaterialPageRoute(builder: (_) => SkateDiceAddPlayer());

      case '/own_the_spot':
        return MaterialPageRoute(builder: (_) => InstagramTabBar());

      case '/error':
        return MaterialPageRoute(builder: (_) => ErrorPage());

      case '/detailed_view':
          return MaterialPageRoute(builder: (_) => DetailedObstacleView(args));

      default:
        return  MaterialPageRoute(builder: (_) => ErrorPage());
    }

  }
}