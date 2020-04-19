import 'package:flutter/material.dart';

class MainPageRoute extends PageRouteBuilder {
  final Widget page;
  MainPageRoute({this.page}):super(
    pageBuilder: (
      BuildContext _context,
      Animation<double> _animation,
      Animation<double> _secondaryAnimation,
    ) => page,
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) => SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn,
        )
      ),
      child: child,
    ),
  );
}
