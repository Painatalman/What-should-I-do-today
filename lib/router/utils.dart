import 'package:flutter/material.dart' show
  MaterialPageRoute,
  Route,
  Navigator;

openPage(context, pageWidget) {
  Route route = MaterialPageRoute(builder: (context) => pageWidget);
  Navigator.push(context, route);
}
