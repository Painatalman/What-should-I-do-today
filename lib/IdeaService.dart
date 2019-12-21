import 'dart:convert' show json;
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

abstract class IdeaService {
  Future<List<String>> loadIdeas();
}

class JsonIdeaService implements IdeaService {
  String source;

  JsonIdeaService(String fileSource) {
    this.source = fileSource;
  }

  Future<List<String>> loadIdeas() async {
    final String ideaData = await rootBundle.loadString(this.source);

    return List<String>.from(json.decode(ideaData)['ideas']);
  }
}
