import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/countries_bean.dart';

class MiscWidget extends StatefulWidget {
  @override
  _MiscWidgetState createState() => _MiscWidgetState();
}

class _MiscWidgetState extends State<MiscWidget> {
  BuildContext _ctx;
  String _date = '', _time = '';
  bool _isChecked = false;
  int _radioValue = 0;
  String _resultRb = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            getAppBarWithBackBtn(ctx: context, title: StringConst.MISC_TITLE),
        body: _createUi(context));
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    print('Start page : ');
    return new Container(
        padding: EdgeInsets.all(5.0),
        child: new Center(
          child: SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                _getRatingBarType(),
                _getOtherWidget(),
                _chipView(),
              ],
            ),
          ),
        ));
  }

  Widget _getRatingBarType() {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          color: ColorConst.RED_COLOR,
          height: 50,
          alignment: Alignment.center,
          child: getTxtWhiteColor(
              msg: 'Rating bar', fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        RatingBar(
          initialRating: 3,
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          allowHalfRating: true,
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(height: 10),
        RatingBarIndicator(
          rating: 2.75,
          itemCount: 5,
          itemSize: 20.0,
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
        ),
        SizedBox(height: 10),
        RatingBar(
            initialRating: 3,
            itemCount: 5,
            itemBuilder: (context, index) {
              // ignore: missing_return
              switch (index) {
                case 0:
                  return Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: Colors.red,
                  );
                case 1:
                  return Icon(
                    Icons.sentiment_dissatisfied,
                    color: Colors.redAccent,
                  );
                case 2:
                  return Icon(
                    Icons.sentiment_neutral,
                    color: Colors.amber,
                  );
                case 3:
                  return Icon(
                    Icons.sentiment_satisfied,
                    color: Colors.lightGreen,
                  );
                case 4:
                  return Icon(
                    Icons.sentiment_very_satisfied,
                    color: Colors.green,
                  );
              }
            },
            onRatingUpdate: (rating) {
              print(rating);
            }),
        SizedBox(height: 10),
      ],
    );
  }

  _getDatePicker() {
    CupertinoDatePicker(
      mode: CupertinoDatePickerMode.dateAndTime,
      initialDateTime: DateTime(1969, 1, 1, 11, 33),
      onDateTimeChanged: (DateTime newDateTime) {
        //Do Some thing
      },
      use24hFormat: false,
      minuteInterval: 1,
    );
  }

  Future<Null> _getAndroidDatePicker(BuildContext context) async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2101));

//    if (picked != null && picked != selectedDate)
    setState(() {
      _date = '${date.year} - ${date.month} - ${date.day}';
    });
  }

  _getTimePicker() {
//    DatePicker.showTimePicker(context,
//        theme: DatePickerTheme(
//          containerHeight: 210.0,
//        ),
//        showTitleActions: true, onConfirm: (time) {
//          print('confirm $time');
//          _time = '${time.hour} : ${time.minute} : ${time.second}';
//          setState(() {});
//        }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  Future<Null> _getAndroidTimePicker(BuildContext context) async {
    TimeOfDay selectedTime = TimeOfDay.now();
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });
    setState(() {
      _time = '${picked_s.hour} : ${picked_s.minute} : ${picked_s.period}';
    });
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          _resultRb = 'EUO';
          break;
        case 1:
          _resultRb = 'POUND';
          break;
        case 2:
          _resultRb = 'YUM';
          break;
      }
    });
  }

  Widget _getOtherWidget() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          color: ColorConst.RED_COLOR,
          height: 50,
          alignment: Alignment.center,
          child: getTxtWhiteColor(
              msg: 'Other Widget', fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        _getPopupMenu(),
        SizedBox(height: 10),
        Switch(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value;
            });
          },
          activeTrackColor: Colors.lightGreenAccent,
          activeColor: Colors.green,
        ),
        SizedBox(height: 10),
        Checkbox(
          value: _isChecked,
          onChanged: (bool value) {
            setState(() {
              _isChecked = value;
            });
          },
          activeColor: Colors.orangeAccent,
        ),
        SizedBox(height: 10),
        getTxtAppColor(
            msg: _resultRb, fontSize: 18, fontWeight: FontWeight.bold),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Radio(
              value: 0,
              autofocus: true,
              groupValue: _radioValue,
              onChanged: _handleRadioValueChange,
            ),
            new Text('Euro'),
            new Radio(
              value: 1,
              groupValue: _radioValue,
              onChanged: _handleRadioValueChange,
            ),
            new Text('Pound'),
            new Radio(
              value: 2,
              groupValue: _radioValue,
              onChanged: _handleRadioValueChange,
            ),
            new Text('Yen'),
          ],
        ),
        SizedBox(height: 10),
        getTxtAppColor(msg: _date, fontSize: 18, fontWeight: FontWeight.bold),
        SizedBox(height: 10),
        RaisedButton(
          textColor: Colors.white,
          onPressed: () => _getDatePicker(),
          child: (Text('Date Picker')),
          color: Colors.blue,
        ),
        SizedBox(height: 10),
        RaisedButton(
          textColor: Colors.white,
          onPressed: () => _getAndroidDatePicker(context),
          child: (Text('Android Date Picker')),
          color: Colors.blue,
        ),
        SizedBox(height: 10),
        getTxtAppColor(msg: _time, fontSize: 18, fontWeight: FontWeight.bold),
        SizedBox(height: 10),
        RaisedButton(
          textColor: Colors.white,
          onPressed: () => _getTimePicker(),
          child: (Text('Time Picker')),
          color: Colors.blue,
        ),
        SizedBox(height: 10),
        RaisedButton(
          onPressed: () => _getAndroidTimePicker(context),
          child: (Text('Android Time Picker')),
          textColor: Colors.white,
          color: Colors.blue,
        ),
        SizedBox(height: 10),
        _cardView(),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _getPopupMenu() {
    return PopupMenuButton(
      itemBuilder: (_) => <PopupMenuItem<String>>[
        PopupMenuItem<String>(child: const Text('Doge'), value: 'Doge'),
        PopupMenuItem<String>(child: const Text('Lion'), value: 'Lion'),
      ],
      onSelected: (selected) {},
      icon: Icon(
        Icons.more_vert,
        color: Colors.blue,
      ),
    );
  }

  Widget _cardView() {
    return Card(
      color: ColorConst.FCM_APP_COLOR,
      elevation: 2.0,
      clipBehavior:Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: SizedBox(
        height: 150,
        width: 300,
        child: Center(
            child: getTxtWhiteColor(
                msg: 'message', fontSize: 22, fontWeight: FontWeight.bold)),
      ),
    );
  }


  Widget _chipView() {
    return Wrap(
      spacing: 4.0, // gap between lines
      children: <Widget>[
        Chip(
          elevation: 15,
          avatar: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text('C', style: TextStyle(color: Colors.white))),
          label: Text('Cupcake'),
          backgroundColor: Colors.white,
        ),
        Chip(
          elevation: 15,
          avatar: CircleAvatar(
              backgroundColor: Colors.cyanAccent,
              child: Text('D', style: TextStyle(color: Colors.black45))),
          label: Text('Donut'),
          backgroundColor: Colors.white,
        ),
        Chip(
          elevation: 15,
          avatar: CircleAvatar(
              backgroundColor: Colors.indigoAccent,
              child: Text('E', style: TextStyle(color: Colors.white))),
          label: Text('Eclair'),
          backgroundColor: Colors.white,
        ),
        Chip(
          elevation: 15,
          avatar: CircleAvatar(
              backgroundColor: Colors.yellowAccent,
              child: Text('F', style: TextStyle(color: Colors.black45))),
          label: Text('Froyo'),
          backgroundColor: Colors.white,
        )
      ],
    );
  }

}
