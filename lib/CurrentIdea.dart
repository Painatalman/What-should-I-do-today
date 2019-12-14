import 'dart:async' show Future;

import 'package:flutter/material.dart';
import 'package:its_flutter/utils.dart' show getRandomItem;
import 'package:its_flutter/IdeaService.dart' show JsonIdeaService;

class CurrentIdeaState extends State<CurrentIdea> {
  static String defaultText = 'loading your next BIG idea';

  // the 'state' thing
  String currentIdea;
  bool isLoading;

  Future<String> loadRandomIdea() async {
    JsonIdeaService service = new JsonIdeaService('assets/data/ideas.json');
    List<dynamic> ideas = await service.loadIdeas();

    return getRandomItem(ideas);
  }

  Future<void> loadIdea() async {
    String idea = await loadRandomIdea();

    setState(() {
      currentIdea = idea;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    currentIdea = defaultText;
    isLoading = true;
    this.loadIdea();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      currentIdea
    );
  }
}

class CurrentIdea extends StatefulWidget {
  @override
  CurrentIdeaState createState() => CurrentIdeaState();
}
