import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';

appSearchBar(context) {
  return PreferredSize(
    child: Material(
      elevation: 1,
      // color: Colors.white,
      child: GestureDetector(
        onTap: () {
          // Rouut.navigator.pushNamed(Rouut.searchScreen);
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 98, 16, 16),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ColorConst.GREY_SHADE,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.search,
                color: ColorConst.APP_COLOR,
              ),
              SizedBox(width: 16),
              Text(
                "search_message",
                style: TextStyle(
                  color: ColorConst.APP_COLOR,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    preferredSize: Size.fromHeight(142),
  );
}
