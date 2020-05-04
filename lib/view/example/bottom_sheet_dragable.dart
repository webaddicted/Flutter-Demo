import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/random_widget.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class BottomSheetDragableScreen extends StatefulWidget {
  @override
  _BottomSheetDragableScreenState createState() => _BottomSheetDragableScreenState();
}

class _BottomSheetDragableScreenState extends State<BottomSheetDragableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, StringConst.DRAGABLE_BOTTOM_SHEET_TITLE),
      body: _createUi(),
    );
  }

  Widget _createUi() {
    return Stack(
      children: <Widget>[
        drag(),
        Container(
          margin: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            SizedBox(height: 20,),
            loadCircleImg('imgUrl', 0, 80),
            SizedBox(height: 20,),
            edtNameField(TextEditingController()),
            SizedBox(height: 10,),
            edtMobileNoField(TextEditingController()),
            SizedBox(height: 30,),
            dummyRaisedBtn('Submit', Colors.blue),
          ],),
        )
      ],
    );
  }

  Widget drag() {
    return SizedBox.expand(
      child: DraggableScrollableSheet(
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            color: Colors.blue[100],
            child: ListView.builder(
              controller: scrollController,
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text('Item $index'));
              },
            ),
          );
        },
      ),
    );
  }

}
