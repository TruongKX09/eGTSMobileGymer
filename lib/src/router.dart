import 'package:flutter/material.dart';

import 'resources_gymer/home_page.dart';
import 'resources_gymer/login_page.dart';

String sPreApiUrl = "https://egts2.azurewebsites.net/api";

class PageRouteNames {
  static const String login = '/login';
  static const String home = '/home_page';
}

const TextStyle textStyle = TextStyle(
  color: Colors.black,
  fontSize: 13.0,
  decoration: TextDecoration.none,
);

Map<String, WidgetBuilder> routes = {
  PageRouteNames.login: (context) => const LoginPage(),
  PageRouteNames.home: (context) => const HomePage(),
};
