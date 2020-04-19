import 'package:flutter/material.dart' show
  Route,
  Navigator;
import 'package:its_flutter/router/MainPageRoute.dart';

openPage(context, pageWidget) {
  Route route = MainPageRoute(page: pageWidget);
  Navigator.push(context, route);
}
