import 'package:flutter/material.dart';

class TaskItem {
  final String title;
  final IconData icon;
  final Widget page;
  final String codePreview;

  TaskItem(
      {Key key,
      @required this.title,
      @required this.page,
      this.icon = Icons.label_important,
      this.codePreview = ''});

}
