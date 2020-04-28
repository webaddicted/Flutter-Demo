import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> chatMessage;
  TextEditingController msg;
  BuildContext ctx;
  @override
  void initState() {
    super.initState();
    chatMessage = new List();
    msg = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        getAppBarWithBackBtn(context, StringConst.CHAT_SCREEN_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        )
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return new Container(
      child: new Column(
        children: <Widget>[
//      Expanded(
//          child:
          Flexible(
            child: new ListView.builder(
                reverse: true,
                itemBuilder: (BuildContext context, int position) {
                  return chatRow(chatMessage[position]);
                }),
          ),
//      ),
         getDivider(),
          Container(
            child: new Row(
              children: <Widget>[
                new Padding(padding: EdgeInsets.only(left: 5, bottom: 5)),
                Flexible(
                  child: new TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      labelText: "enter message",
                      fillColor: ColorConst.BLACK_COLOR,
                    ),
                    controller: msg,
                  ),
                ),
                new IconButton(
                  icon: new Icon(
                    Icons.send,
                    color:ColorConst.APP_COLOR,
                  ),
                  onPressed: () => {submit(msg.text)},
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          )
//              )
        ],
      ),
    );
  }

  Widget chatRow(String message) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        child: Row(
          children: <Widget>[
            new CircleAvatar(
              radius: 30,
              backgroundColor: ColorConst.APP_COLOR,
              child: new Text(
                "P",
                style: new TextStyle(fontSize: 20, color: ColorConst.WHITE_COLOR, fontWeight: FontWeight.bold),
              ),
            ),
            new Padding(padding: EdgeInsets.only(left: 10)),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Text("Pankaj",style: TextStyle(fontWeight: FontWeight.bold),),
                new Padding(padding: EdgeInsets.only(top: 3)),
                new Text(
                  "$message",
                  style: new TextStyle(color: ColorConst.GREY_COLOR, fontSize: 15),
                )
              ],
            )

          ],
        ),
      ),
    );
  }

  submit(String text) {
    debugPrint("click submit btn");
    setState(() {
      chatMessage.insert(0, text);
      msg.text = "";
    });
  }
}
