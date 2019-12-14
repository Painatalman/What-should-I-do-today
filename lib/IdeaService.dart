import 'dart:convert' show json;
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

abstract class IdeaService {
  Future<List<dynamic>> loadIdeas();
}

class JsonIdeaService implements IdeaService {
  String source;

  JsonIdeaService(String fileSource) {
    this.source = fileSource;
  }

  Future<List> loadIdeas() async {
    final String ideaData = await rootBundle.loadString(this.source);

    final ideas = json.decode(ideaData);
    return ideas['ideas'];
  }
}
