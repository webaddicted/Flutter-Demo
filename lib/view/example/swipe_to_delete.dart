import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class SwipeToDelete extends StatefulWidget {
  @override
  _SwipeToDeleteState createState() => _SwipeToDeleteState();
}

class _SwipeToDeleteState extends State<SwipeToDelete> {
  BuildContext _ctx;
  List dataResult;

  @override
  void initState() {
    super.initState();
    dataResult = List();
    dataResult.add('Item : 1');
    dataResult.add('Item : 2');
    dataResult.add('Item : 3');
    dataResult.add('Item : 4');
    dataResult.add('Item : 5');
    dataResult.add('Item : 6');
    dataResult.add('Item : 7');
    dataResult.add('Item : 8');
    dataResult.add('Item : 9');
    dataResult.add('Item : 10');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.SWIPE_TO_DELETE_TITLE),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          onPressed: () {
            dataResult.add('Item : ' + (dataResult.length + 1).toString());
            setState(() {});
          }),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    return new Container(
      child: new ListView.builder(
          itemCount: dataResult == null ? 0 : dataResult.length,
          itemBuilder: (BuildContext context, int index) {
            return createRow(index);
          }),
    );
  }

  Widget createRow(int index) {
    return Container(
      child: Card(
        child: Dismissible(
          key: Key(dataResult[index]),
          onDismissed: (direction) {
            dataResult.removeAt(index);
            showSnackBar(_ctx, 'Item dismissed.');
          },
          background: Container(
            color: Colors.red,
          ),
          child: Container(
              padding: EdgeInsets.all(20),
              child: getTxt(msg: dataResult[index])),
        ),
      ),
    );
  }
}
