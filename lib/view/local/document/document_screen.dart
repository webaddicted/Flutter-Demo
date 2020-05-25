import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class DocumentScreen extends StatefulWidget {
  @override
  _DocumentScreenState createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  BuildContext _ctx;
  var listData = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(context, StringConst.DOCUMENTS_TITLE),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh), onPressed: () {}),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return new Container(
      alignment: Alignment.center,
      child:
          ListView.builder(
            itemCount: listData.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0)
                return showPbIndicator(true);
              else
                return Container();
            },
          )
    );
  }
}
