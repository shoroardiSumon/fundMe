import 'package:flutter/material.dart';

Route appNavigator(Widget page, Offset offset, int duration) {
  return PageRouteBuilder(
    fullscreenDialog: true,
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween = Tween(begin: offset, end: Offset.zero)
          .chain(CurveTween(curve: Curves.ease));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    transitionDuration: Duration(milliseconds: duration),
  );
}