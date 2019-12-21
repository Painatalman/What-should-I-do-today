import 'package:flutter/material.dart' show
  BuildContext,
  ListView,
  ListTile,
  StatelessWidget,
  Text,
  Widget;

class IdeaList extends StatelessWidget {
  final List<String> ideas;

  const IdeaList(this.ideas);
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ideas.map(
        (idea) => ListTile(
          title: Text(idea)
        )
      ).toList(),
    );
  }
}
