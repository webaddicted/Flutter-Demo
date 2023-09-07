import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';

class TabItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final Function onTap;
  final bool isHomeSelected;
  const TabItem({super.key, required this.text, required this.icon, required this.isSelected, required this.onTap, required this.isHomeSelected});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> onTap(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, color: !isHomeSelected && isSelected ? ColorConst.appColor : Colors.grey),
            Text(text, style: TextStyle(
                color: !isHomeSelected && isSelected ? ColorConst.appColor : Colors.grey,
                fontWeight: !isHomeSelected && isSelected ? FontWeight.w600 : FontWeight.normal,
                fontSize: 12
            ),)
          ],
        ),
      ),
    );
  }
}