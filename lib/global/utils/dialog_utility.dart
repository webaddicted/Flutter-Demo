import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

showAlertDialog({BuildContext? ctx, String title = '', String msg = ""}) => showDialog(
    context: ctx!,
    builder:(_) =>  AlertDialog(
      title: getTxtBlackColor(msg: title, fontWeight: FontWeight.bold),
      content: getTxt(msg: msg),
    ));

showSingleClickDialog(
        {BuildContext? ctx, String title = '', String msg = '', Function? okClick}) =>
    showDialog(
      context: ctx!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            title: getTxtBlackColor(msg: title, fontWeight: FontWeight.bold),
            content: getTxt(msg: msg),
            actions: [MaterialButton(onPressed: okClick!(), child: const Text("OK"))]);
      },
    );

showTwoClickDialog(
        {BuildContext? ctx,
        String title = '',
        String msg = '',
        required Function okClick,
        required Function cancelClick}) =>
    showDialog(
      context: ctx!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            title: getTxtBlackColor(msg: title, fontWeight: FontWeight.bold),
            content: getTxt(msg: msg),
            actions: [
              MaterialButton(onPressed: okClick(), child: getTxt(msg: 'OK')),
              MaterialButton(onPressed: cancelClick(), child: getTxt(msg: 'Cancel')),
            ]);
      },
    );

showCustomDialog({BuildContext? ctx, Widget? dialogUi}) => showDialog(
    context: ctx!,
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
    Key? key,
    this.height = 200.0,
    required this.message,
    required this.onPresedPositiveButton,
    required this.onPresedNegativeButton,
    required this.title,
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
    decoration: const BoxDecoration(

        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(18))
    ),
    child: Column(
      children: <Widget>[

        const SizedBox(height:20),
        Text(title,style: const TextStyle(fontSize:20,color:Colors.black,fontWeight: FontWeight.bold),),
        const SizedBox(height:15),
        Padding(
          padding: const EdgeInsets.only(right: 10,left: 10),
          child: Text(message,style: const TextStyle(fontSize:15,color:Colors.black),textAlign:TextAlign.center,),
        ),
        const SizedBox(height:34),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MaterialButton(onPressed: (){
              onPresedNegativeButton();

            },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)), child: const Text('No'),),
            const SizedBox(width:20),
            MaterialButton(onPressed: (){
              onPresedPositiveButton();
            },
                color:Colors.redAccent,
                child: const Text('Yes',style: TextStyle(color:Colors.white))),
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
    Key? key,
    this.height = 350.0,
    required this.imagePath,
    required this.message,
    required this.onPresedPositiveButton,
    required this.onPresedNegativeButton,
    required this.title,
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
    decoration: const BoxDecoration(
        color: Colors.redAccent,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(18))
    ),
    child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(18))
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(imagePath,height: 120,width: 120,),
          ),
        ),
        const SizedBox(height:20),
        Text(title,style: const TextStyle(fontSize:20,color:Colors.white,fontWeight: FontWeight.bold),),
        const SizedBox(height:15),
        Padding(
          padding: const EdgeInsets.only(right: 10,left: 10),
          child: Text(message,style: const TextStyle(fontSize:15,color:Colors.white),textAlign:TextAlign.center,),
        ),
        const SizedBox(height:20),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MaterialButton(onPressed: (){
              onPresedNegativeButton();

            }, child: const Text('No'),),
            MaterialButton(onPressed: (){
              onPresedPositiveButton();
            },
                color:Colors.white,
                child: const Text('Yes',style: TextStyle(color:Colors.redAccent))),
          ],
        )
      ],
    ),
  );
}



