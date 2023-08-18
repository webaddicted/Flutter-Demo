import 'package:flutter/material.dart';

class RouteTransition extends PageRouteBuilder {
  final Widget widget;
  final bool fade;

  RouteTransition({required this.widget, this.fade = true})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              if (fade) {
                return FadeTransition(opacity: animation, child: child);
              }
              {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              }
            });
}
