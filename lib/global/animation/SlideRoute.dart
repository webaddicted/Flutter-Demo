import 'package:flutter/material.dart';

class RouteTransition extends PageRouteBuilder {
  final Widget widget;
  final bool fade;

  RouteTransition({this.widget, this.fade = true})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              if (fade) {
                return new FadeTransition(opacity: animation, child: child);
              }
              {
                return SlideTransition(
                  position: new Tween<Offset>(
                    begin: const Offset(0.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              }
            });
}
