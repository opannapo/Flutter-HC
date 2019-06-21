import 'package:flutter/material.dart';

class PageRouteFade extends MaterialPageRoute {
  int duration;

  PageRouteFade(direct, this.duration) : super(builder: (context) => direct);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> firstAnim,
      Animation<double> secAnim, Widget child) {
    return FadeTransition(opacity: firstAnim, child: child);
  }

  @override
  Duration get transitionDuration {
    return Duration(milliseconds: duration);
  }
}
