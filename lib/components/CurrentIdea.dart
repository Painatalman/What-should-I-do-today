import 'dart:async' show Completer, Future;

import 'package:flutter/material.dart';
import 'package:its_flutter/utils.dart' show getRandomItem;
import 'package:its_flutter/IdeaService.dart' show JsonIdeaService;

class CurrentIdeaState extends State<CurrentIdea>
    with SingleTickerProviderStateMixin {
  static String defaultText = 'loading your next BIG idea';

  // the 'state' thing
  String currentIdea;
  bool isLoading;
  AnimationController zoomInController;
  Animation<double> zoomIn;

  Future<String> loadRandomIdea() async {
    JsonIdeaService service = new JsonIdeaService('assets/data/ideas.json');
    List<dynamic> ideas = await service.loadIdeas();

    return getRandomItem(ideas);
  }

  Future<void> loadIdea() async {
    setState(() {
      isLoading = true;
    });

    String idea = await loadRandomIdea();

    await this.zoomOut();
    setState(() {
      currentIdea = idea;
    });
    await this.zoom();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> deferAnimation(controllerMethod) async {
    Completer animationDone = Completer();
    void resolveFuture(status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        zoomIn.removeStatusListener(resolveFuture);
        animationDone.complete();
      }
    }

    zoomIn.addStatusListener(resolveFuture);
    controllerMethod();

    if (zoomIn.status == AnimationStatus.dismissed) {
      zoomIn.removeStatusListener(resolveFuture);
      animationDone.complete();
    }

    return animationDone.future;
  }

  Future<void> zoomOut() async {
    return await this.deferAnimation(zoomInController.reverse);
  }

  Future<void> zoom() async {
    return await this.deferAnimation(zoomInController.forward);
  }

  @override
  void initState() {
    super.initState();
    currentIdea = defaultText;
    isLoading = true;
    zoomInController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    zoomIn = Tween<double>(begin: 0.0, end: 18.0).animate(zoomInController);
    zoomIn.addListener(() {
      setState(() {});
    });

    this.loadIdea();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Center(
            child: Text(
              currentIdea,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.w800,
                fontSize: zoomIn.value
              )
            )
          )
        ),
        Positioned(
          bottom: 25,
          right: 25,
          child: FloatingActionButton.extended(
            icon: Icon(isLoading ? Icons.hourglass_empty : Icons.lightbulb_outline),
            label: Text(isLoading ? 'loading...' : 'get idea'),
            backgroundColor: isLoading ? Colors.blueGrey : Colors.blue,
            onPressed: isLoading ? null : this.loadIdea,
          ),
        )
      ]
    );
  }
}

class CurrentIdea extends StatefulWidget {
  @override
  CurrentIdeaState createState() => CurrentIdeaState();
}
