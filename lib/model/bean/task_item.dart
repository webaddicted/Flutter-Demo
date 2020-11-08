import 'package:flutter/material.dart';

class TaskItem {
  final String title;
  final IconData icon;
  final Widget page;
  final List<TaskItem> subItem;

  final String codePreview;

  TaskItem.normal(this.title,
      {this.page, this.icon, this.codePreview, this.subItem});

  TaskItem({
    Key key,
    @required this.title,
   this.page,
    this.subItem,
    this.icon = Icons.label_important,
    this.codePreview = '',
  });
}
