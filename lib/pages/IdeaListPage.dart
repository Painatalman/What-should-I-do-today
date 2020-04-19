import 'package:flutter/material.dart';

import 'package:its_flutter/IdeaService.dart';
import 'package:its_flutter/components/IdeaList.dart';
import 'package:its_flutter/components/Navbar.dart';
import 'package:its_flutter/components/Preloader.dart';

class IdeaListPageState extends State<IdeaListPage>
    with SingleTickerProviderStateMixin {
  // the 'state' thing
  List<String> ideas;
  bool isLoading;
  AnimationController _controller;
  Animation<Offset> slideOut;

  loadIdeas() async {
    JsonIdeaService service = new JsonIdeaService('assets/data/ideas.json');
    ideas = await service.loadIdeas();

    setState(() {
      ideas = ideas;
      isLoading = false;
    });

    _controller.forward();
  }

  @override
  void initState() {
    super.initState();
    ideas = [];
    isLoading = true;
    _controller =
        AnimationController(duration: Duration(milliseconds: 2500), vsync: this);
    slideOut = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(
        1.0,
        0.0
      ),
      
    ).animate(_controller);
    slideOut.addListener(() {
      setState(() {});
    });
    this.loadIdeas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: SafeArea(
        child: Stack(
          children: [
            Center(child: IdeaList(ideas)),
            SlideTransition(
              position: slideOut,
              child: Preloader(text:'Loading ideas...')
            )
          ]
        )
      )
    );
  }
}

class IdeaListPage extends StatefulWidget {
  @override
  IdeaListPageState createState() => IdeaListPageState();
}
