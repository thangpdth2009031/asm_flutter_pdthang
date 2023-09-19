import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page_new.dart';
import '../pages/main_page.dart';

final Map<String, WidgetBuilder> routes = {
  MainPage.routeName: (context) => const MainPage(),
  "/": (context) => const MainPage(),
};
