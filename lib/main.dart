import 'package:flutter/material.dart';

import 'package:its_flutter/CurrentIdea.dart' show CurrentIdea;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String title = 'What should I do today?';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: CurrentIdea(),
        ),
      )
    );
  }
}


