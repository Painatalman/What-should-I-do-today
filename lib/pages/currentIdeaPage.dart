import 'package:flutter/material.dart' show BuildContext, Center, SafeArea, Scaffold, StatelessWidget, Widget;

import 'package:its_flutter/components/CurrentIdea.dart';
import 'package:its_flutter/components/Navbar.dart';

class CurrentIdeaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: SafeArea(
        child:Center(
          child:CurrentIdea()
        )
      ),
    );
  }
}
