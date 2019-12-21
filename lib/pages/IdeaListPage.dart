import 'package:flutter/material.dart';

import 'package:its_flutter/IdeaService.dart';
import 'package:its_flutter/components/IdeaList.dart';
import 'package:its_flutter/components/Navbar.dart';

class IdeaListPageState extends State<IdeaListPage> {
  static String defaultText = 'loading your next BIG idea';

  // the 'state' thing
  List<String> ideas;
  bool isLoading;

  loadIdeas() async {
    JsonIdeaService service = new JsonIdeaService('assets/data/ideas.json');
    ideas = await service.loadIdeas();

    setState(() {
      ideas = ideas;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    ideas = [];
    isLoading = true;
    this.loadIdeas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body:  Center(
          child: isLoading ? Text("Loading ideas...") : IdeaList(ideas)
        ),
    );
  }
}

class IdeaListPage extends StatefulWidget {
  @override
  IdeaListPageState createState() => IdeaListPageState();
}
