import 'package:flutter/material.dart';
import 'package:trogon_media_test/presentation/screens/navigation_screen/navigation_screen.dart';

import '../routes/route_constants.dart';
import '../screens/course_screen/course_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/session_screen/session_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> get routes => {
        RouteList.initial: (context) => const NavigationScreen(),
        RouteList.homeScreen: (context) => const HomeScreen(),
        RouteList.courseScreen: (context) => const CourseScreen(),
        RouteList.sessionScreen: (context) => const SessionScreen(),

      };
}
