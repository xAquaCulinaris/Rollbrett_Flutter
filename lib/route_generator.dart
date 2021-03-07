import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/CoursePreview/coursePreview.dart';
import 'package:rollbrett_rottweil/CoursePreview/detailedObstacleView.dart';
import 'package:rollbrett_rottweil/ErrorPage/errorPage.dart';
import 'package:rollbrett_rottweil/HomeScreen/homeScreen.dart';
import 'package:rollbrett_rottweil/Login/Authenticate.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/ProfileView/EditProfile/editProfileView.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/ProfileView/profilePostView.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/ownTheSpotTabBar.dart';
import 'package:rollbrett_rottweil/SkateDice/SkateDiceModelController.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDiceTabBar.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Authenticate());

      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case '/course_preview':
        return MaterialPageRoute(builder: (_) => CoursePreview());

      case '/own_the_spot':
        return MaterialPageRoute(builder: (_) => OwnTheSpotTabBar());

      case '/error':
        return MaterialPageRoute(builder: (_) => ErrorPage());

      case '/detailed_view':
        return MaterialPageRoute(builder: (_) => DetailedObstacleView(args));

      case '/profile_post_view':
        return MaterialPageRoute(builder: (_) => ProfilePostView(args));

      case '/edit_profile_view':
        return MaterialPageRoute(builder: (_) => EditProfileView());

      case '/skate_dice_tabbar':
        return MaterialPageRoute(builder: (_) => SkateDiceModelController(child: SkateDiceTabBar()));

      default:
        return MaterialPageRoute(builder: (_) => ErrorPage());
    }
  }
}
