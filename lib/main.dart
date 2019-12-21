import 'package:flutter/material.dart' show MaterialApp, runApp, BuildContext, Widget, StatelessWidget;

import 'package:its_flutter/meta/info.dart' show MetaInfo;
import 'package:its_flutter/pages/currentIdeaPage.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const appName = MetaInfo.appName;

    return MaterialApp(
      title: appName,
      home: CurrentIdeaPage()
    );
  }
}


