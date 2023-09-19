import 'package:flutter/material.dart';
import '../pages/main_page.dart';
import '../pages/welcome_page.dart';

final Map<String, WidgetBuilder> routes = {
  MainPage.routeName: (context) => const MainPage(),
  "/": (context) => const WelcomePage(),
};
