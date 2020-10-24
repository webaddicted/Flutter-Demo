import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/widgets/chat_msg_widget.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMsgWidget> _messages = <ChatMsgWidget>[];
  final _textController = TextEditingController();
  String formattedDate = '';
  bool rightMsg = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd hh:mm').format(time);
    return Scaffold(
        appBar: getAppBarWithBackBtn(
            ctx: context, title: StringConst.CHAT_SCREEN_TITLE),
        body: Builder(
          builder: (context) => _createUi(),
        ));
  }

  Widget _createUi() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: new Container(
          child: new Column(
            children: <Widget>[
              //Chat list
              new Flexible(
                child: new ListView.builder(
                  padding: new EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (_, int index) => _messages[index],
                  itemCount: _messages.length,
                ),
              ),
              new Divider(height: 1.0),
              new Container(
                  decoration:
                      new BoxDecoration(color: Theme.of(context).cardColor),
                  child: new IconTheme(
                      data: new IconThemeData(
                          color: Theme.of(context).accentColor),
                      child: new Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: new Row(
                          children: <Widget>[
                            //left send button

                            new Container(
                              width: 48.0,
                              height: 48.0,
                              child: new IconButton(
                                  icon: Icon(Icons.camera),
                                  onPressed: () => {}),
                            ),

                            //Enter Text message here
                            new Flexible(
                              child: new TextField(
                                controller: _textController,
                                decoration: new InputDecoration.collapsed(
                                    hintText: "Enter message"),
                              ),
                            ),

                            //right send button

                            new Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 2.0),
                                width: 48.0,
                                height: 48.0,
                                child: new IconButton(
                                    icon: Icon(Icons.send),
                                    onPressed: () => rightMsg
                                        ? _sendMsg(_textController.text,
                                            'right', formattedDate)
                                        : _sendMsg(_textController.text, 'left',
                                            formattedDate))),
                          ],
                        ),
                      ))),
            ],
          ),
        ));
  }

  void _sendMsg(String msg, String messageDirection, String date) {
    rightMsg = !rightMsg;
    if (msg.length == 0) {
      showSnackBar(context, 'Please Enter Message');
    } else {
      _textController.clear();
      ChatMsgWidget message = new ChatMsgWidget(
        msg: msg,
        direction: messageDirection,
        dateTime: date,
      );
      setState(() {
        _messages.insert(0, message);
      });
    }
  }

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    // Clean up the controller when the Widget is disposed
    _textController.dispose();
    super.dispose();
  }
}
