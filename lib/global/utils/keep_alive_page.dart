import 'package:flutter/material.dart';

class KeepAlivePage extends StatefulWidget {
  KeepAlivePage({required this.child});

  final Widget child;

  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    /// Dont't forget this
    super.build(context);

    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}