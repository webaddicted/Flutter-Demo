import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';

class ChatMsgWidget extends StatelessWidget {
  ChatMsgWidget({this.msg, this.current, this.dateTime});

  final String msg;
  final bool current;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          current ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment:
          current ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: current ? 30.0 : 20.0),
        if (!current) ...[
          CircleAvatar(
            backgroundImage: NetworkImage(
              current ? ApiConstant.DEMO_IMG : ApiConstant.WEBADDICTED_IMG,
            ),
            radius: 20.0,
          ),
          const SizedBox(width: 5.0),
        ],

        ///Chat bubbles
        Container(
          padding: EdgeInsets.only(
            bottom: 5,
            right: 5,
          ),
          child: Column(
            crossAxisAlignment:
                current ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(
                  minHeight: 40,
                  maxHeight: 250,
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                  minWidth: MediaQuery.of(context).size.width * 0.1,
                ),
                decoration: BoxDecoration(
                  color: current ? Colors.deepPurple : Colors.white,
                  borderRadius: current
                      ? BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )
                      : BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, top: 10, bottom: 5, right: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: current
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          msg,
                          style: TextStyle(
                            color: current ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.done_all,
                        color: Colors.white,
                        size: 14,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "2:02",
                style: TextStyle(
                    fontSize: 12, color: Colors.black.withOpacity(0.5)),
              )
            ],
          ),
        ),
        if (current) ...[
          const SizedBox(width: 5.0),
          CircleAvatar(
            backgroundImage: NetworkImage(
              current ? ApiConstant.DEMO_IMG : ApiConstant.WEBADDICTED_IMG,
            ),
            radius: 10.0,
          ),
        ],
        SizedBox(width: current ? 20.0 : 30.0),
      ],
    );
  }
}
// return  Container(
//   margin: const EdgeInsets.symmetric(vertical: 10.0),
//   child: direction == 'left'
//       ? new Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           new Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               new Stack(
//                 children: <Widget>[
//                   //for left corner
//
//                   new Image.asset(
//                     'assets/images/in.png',
//                     fit: BoxFit.scaleDown,
//                     width: 30.0,
//                     height: 30.0,
//                   ),
//
//                   new Container(
//                     margin: EdgeInsets.only(left: 6.0),
//                     decoration: new BoxDecoration(
//                       color: Color(0xffd6d6d6),
//                       border: new Border.all(
//                           color: Color(0xffd6d6d6),
//                           width: .25,
//                           style: BorderStyle.solid),
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(5.0),
//                         topLeft: Radius.circular(5.0),
//                         bottomRight: Radius.circular(0.0),
//                         bottomLeft: Radius.circular(0.0),
//                       ),
//                     ),
//                     alignment: Alignment.bottomLeft,
//                     padding: const EdgeInsets.all(8.0),
//                     child: new Text(
//                       msg,
//                       style: new TextStyle(
//                         fontFamily: 'Gamja Flower',
//                         fontSize: 20.0,
//                         color: Color(0xff000000),
//                       ),
//                     ),
//                     width: 180.0,
//                   ),
//                 ],
//               ),
//
//               //date time
//               new Container(
//                 margin: EdgeInsets.only(left: 6.0),
//                 decoration: new BoxDecoration(
//                   color: Color(0xffd6d6d6),
//                   border: new Border.all(
//                       color: Color(0xffd6d6d6),
//                       width: .25,
//                       style: BorderStyle.solid),
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(0.0),
//                     topLeft: Radius.circular(0.0),
//                     bottomRight: Radius.circular(5.0),
//                     bottomLeft: Radius.circular(5.0),
//                   ),
//                 ),
//                 alignment: Alignment.bottomLeft,
//                 padding: const EdgeInsets.only(
//                     top: 0.0, bottom: 8.0, left: 8.0, right: 8.0),
//                 child: new Text(
//                   dateTime,
//                   style: new TextStyle(
//                     fontSize: 8.0,
//                     color: Color(0xff000000),
//                   ),
//                 ),
//                 width: 180.0,
//               ),
//             ],
//           ),
//         ],
//       ))
//       : new Row(
//     mainAxisAlignment: MainAxisAlignment.end,
//     children: <Widget>[
//       new Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: <Widget>[
//           new Stack(
//             alignment: Alignment.topRight,
//             children: <Widget>[
//               //for right corner
//               new Image.asset(
//                 'assets/images/out.png',
//                 fit: BoxFit.scaleDown,
//                 width: 30.0,
//                 height: 30.0,
//               ),
//
//               new Container(
//                 margin: EdgeInsets.only(right: 6.0),
//                 decoration: new BoxDecoration(
//                   color: Color(0xffef5350),
//                   border: new Border.all(
//                       color: Color(0xffef5350),
//                       width: .25,
//                       style: BorderStyle.solid),
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(5.0),
//                     topLeft: Radius.circular(5.0),
//                     bottomRight: Radius.circular(0.0),
//                     bottomLeft: Radius.circular(0.0),
//                   ),
//                 ),
//                 alignment: Alignment.bottomRight,
//                 padding: const EdgeInsets.all(8.0),
//                 child: new Text(
//                   msg,
//                   style: new TextStyle(
//                     fontFamily: 'Gamja Flower',
//                     fontSize: 20.0,
//                     color: Color(0xffffffff),
//                   ),
//                 ),
//                 width: 180.0,
//               ),
//             ],
//           ),
//
//           //date time
//           new Container(
//             margin: EdgeInsets.only(right: 6.0),
//             decoration: new BoxDecoration(
//               color: Color(0xffef5350),
//               border: new Border.all(
//                   color: Color(0xffef5350),
//                   width: .25,
//                   style: BorderStyle.solid),
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(0.0),
//                 topLeft: Radius.circular(0.0),
//                 bottomRight: Radius.circular(5.0),
//                 bottomLeft: Radius.circular(5.0),
//               ),
//             ),
//             alignment: Alignment.bottomRight,
//             padding: const EdgeInsets.only(
//                 top: 0.0, bottom: 8.0, left: 8.0, right: 8.0),
//             child: new Text(
//               dateTime,
//               style: new TextStyle(
//                 fontSize: 8.0,
//                 color: Color(0xffffffff),
//               ),
//             ),
//             width: 180.0,
//           ),
//         ],
//       ),
//     ],
//   ),
// );
