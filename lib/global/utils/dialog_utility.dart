import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

showAlertDialog({BuildContext ctx, String title, String msg}) => showDialog(
    context: ctx,
    builder:(_) =>  new AlertDialog(
      title: getTxtBlackColor(msg: title, fontWeight: FontWeight.bold),
      content: getTxt(msg: msg),
    ));

showSingleClickDialog(
        {BuildContext ctx, String title, String msg, Function okClick}) =>
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            title: getTxtBlackColor(msg: title, fontWeight: FontWeight.bold),
            content: getTxt(msg: msg),
            actions: [FlatButton(child: Text("OK"), onPressed: okClick)]);
      },
    );

showTwoClickDialog(
        {BuildContext ctx,
        String title,
        String msg,
        Function okClick,
        Function cancelClick}) =>
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            title: getTxtBlackColor(msg: title, fontWeight: FontWeight.bold),
            content: getTxt(msg: msg),
            actions: [
              FlatButton(child: getTxt(msg: 'OK'), onPressed: okClick),
              FlatButton(child: getTxt(msg: 'Cancel'), onPressed: cancelClick),
            ]);
      },
    );

showCustomDialog({BuildContext ctx, Widget dialogUi}) => showDialog(
    context: ctx,
    builder: (BuildContext ctx) {
      return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: dialogUi);
    });

class MaterialAlertDialog extends StatelessWidget {
  final double height;
  final String title;
  final String message;
  final Function onPresedPositiveButton;
  final Function onPresedNegativeButton;
  const MaterialAlertDialog({
    Key key,
    this.height = 200.0,
    @required this.message,
    @required this.onPresedPositiveButton,
    @required this.onPresedNegativeButton,
    @required this.title,
  }) : super(key: key);


  @override
  Widget build(BuildContext context){
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
    height: 200,
    decoration: BoxDecoration(

        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(18))
    ),
    child: Column(
      children: <Widget>[

        SizedBox(height:20),
        Text(title,style: TextStyle(fontSize:20,color:Colors.black,fontWeight: FontWeight.bold),),
        SizedBox(height:15),
        Padding(
          padding: const EdgeInsets.only(right: 10,left: 10),
          child: Text(message,style: TextStyle(fontSize:15,color:Colors.black),textAlign:TextAlign.center,),
        ),
        SizedBox(height:34),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            OutlineButton(onPressed: (){
              onPresedNegativeButton();

            }, child: Text('No'),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),),
            SizedBox(width:20),
            RaisedButton(onPressed: (){
              onPresedPositiveButton();
            },
                child: Text('Yes',style: TextStyle(color:Colors.white)),
                color:Colors.redAccent),
          ],
        )
      ],
    ),
  );
}

class AnimatedMaterialAlertDialog extends StatelessWidget {
  final double height;
  final String imagePath;
  final String title;
  final String message;
  final Function onPresedPositiveButton;
  final Function onPresedNegativeButton;
  const AnimatedMaterialAlertDialog({
    Key key,
    this.height = 350.0,
    @required this.imagePath,
    @required this.message,
    @required this.onPresedPositiveButton,
    @required this.onPresedNegativeButton,
    @required this.title,
  }) : super(key: key);


  @override
  Widget build(BuildContext context){

    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
    height: 290,
    decoration: BoxDecoration(
        color: Colors.redAccent,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(18))
    ),
    child: Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(imagePath,height: 120,width: 120,),
          ),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(18))
          ),
        ),
        SizedBox(height:20),
        Text(title,style: TextStyle(fontSize:20,color:Colors.white,fontWeight: FontWeight.bold),),
        SizedBox(height:15),
        Padding(
          padding: const EdgeInsets.only(right: 10,left: 10),
          child: Text(message,style: TextStyle(fontSize:15,color:Colors.white),textAlign:TextAlign.center,),
        ),
        SizedBox(height:20),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton(onPressed: (){
              onPresedNegativeButton();

            }, child: Text('No'),),
            RaisedButton(onPressed: (){
              onPresedPositiveButton();
            },
                child: Text('Yes',style: TextStyle(color:Colors.redAccent)),
                color:Colors.white),
          ],
        )
      ],
    ),
  );
}



