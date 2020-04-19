
import 'package:flutter/material.dart'
    show Align, Alignment, BuildContext, CircleAvatar, Colors, Column, Container, Icon, Icons, MainAxisAlignment, Row, StatelessWidget, Text, TextAlign, Widget;
import 'package:its_flutter/meta/theme.dart';

class Preloader extends StatelessWidget {
  final String text;

  const Preloader({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50.0,
          backgroundColor: Theme.mainColor,
          backgroundImage: Theme.defaultImage,
        ),
        Align(
          alignment: Alignment.center,
          child:Row(
          children: [
            Icon(Icons.hourglass_empty),
            Text(
              text,
              textAlign: TextAlign.center,
            )
          ]
        ))
      ],
    ));
  }
}
