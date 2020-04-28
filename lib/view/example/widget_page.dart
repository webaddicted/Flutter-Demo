import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/customview/circle_progress_bar.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class WidgetPage extends StatefulWidget {
  @override
  _WidgetPageState createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage>{
  BuildContext _ctx;
  String _btnText = "Hello World";
  bool _passwordVisible = false;
  String _date = '', _time = '';
  bool _isChecked = false;
  int _radioValue = 0;
  String _resultRb = '';
  double index = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(context, StringConst.WIDGET_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return new Container(
        padding: EdgeInsets.all(5.0),
        child: new Center(
          child: SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                getTextType(),
                getButtonType(),
                getTextFieldType(),
                getImageType(),
                getProgressBarType(),
                getRatingBarType(),
                getOtherType(),
              ],
            ),
          ),
        ));
  }

  changeText() {
    setState(() {
      if (_btnText.startsWith("H"))
        _btnText = "Welcome To my app";
      else
        _btnText = "Hello world !!!";
    });
  }

  Widget getTextType() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          color: ColorConst.RED_COLOR,
          height: 50,
          alignment: Alignment.center,
          child: getTxtWhiteColor('Text', 15, FontWeight.bold),
        ),
        SizedBox(height: 10),
        new Text(_btnText),
        SizedBox(height: 10),
        Container(
          color: ColorConst.GREEN_COLOR,
          height: 40,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: getTxtWhiteColor(StringConst.APP_NAME, 15, FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        getTxtBlackColor(StringConst.APP_NAME, 15, FontWeight.normal),
        SizedBox(height: 10),
        getTxtGreyColor(StringConst.APP_NAME, 15, FontWeight.bold),
        SizedBox(height: 10),
        getTxtAppColor(StringConst.APP_NAME, 15, FontWeight.bold),
        SizedBox(height: 10),
        getTxtColor(StringConst.APP_NAME, ColorConst.GREEN_COLOR, 15,
            FontWeight.bold),
        SizedBox(height: 10),
        Text(
          "TextStyle with easy parameters",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            background: Paint()
              ..color = Color(0xffc7e5b4)
              ..style = PaintingStyle.fill,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "TextStyle with decoration underline",
          style: TextStyle(
              fontSize: 20,
              background: Paint()..color = Colors.lightGreenAccent,
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
              decorationStyle: TextDecorationStyle.wavy),
        ),
        SizedBox(height: 10),
        Text(
          "TextStyle with decoration lineThrough",
          style: TextStyle(
              fontSize: 20,
              background: Paint()..color = Colors.blueAccent,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.black,
              decorationStyle: TextDecorationStyle.double),
        ),
        SizedBox(height: 10),
        Container(
          constraints: BoxConstraints.expand(height: 40),
          color: Colors.white,
          child: Text(
            "TextAlign end",
            style: TextStyle(background: Paint()..color = Colors.orangeAccent),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  Widget getButtonType() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          color: ColorConst.RED_COLOR,
          height: 50,
          alignment: Alignment.center,
          child: getTxtWhiteColor('Text Button', 15, FontWeight.bold),
        ),
        SizedBox(height: 10),
        OutlineButton(
          child: new Text('Outline Button'),
          onPressed: () => showSnackBar(_ctx, 'Outline Button click'),
        ),
        SizedBox(height: 10),
        IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () => showSnackBar(_ctx, 'Icon Button click'),
        ),
        SizedBox(height: 10),
        RaisedButton(
          onPressed: () => showSnackBar(_ctx, 'Raised button click'),
          child: (Text('Raised button')),
          color: Colors.orangeAccent,
        ),
        SizedBox(height: 10),
        FloatingActionButton(
          onPressed: () => showSnackBar(_ctx, 'Floating action Button click'),
          child: new Icon(Icons.add),
        ),
        SizedBox(height: 10),
        MaterialButton(
          height: 60,
          color: Colors.green,
          child: Icon(
            Icons.email,
            color: Colors.white,
          ),
          onPressed: () => showSnackBar(_ctx, 'Circle Button click'),
          padding: EdgeInsets.all(2),
          elevation: 2,
          shape: CircleBorder(side: BorderSide(color: Colors.deepOrange)),
        ),
        SizedBox(height: 10),
        MaterialButton(
          child: Text('Rounded Rectangle Border button'),
          onPressed: () =>
              showSnackBar(_ctx, 'Rounded Rectangle Border Button click'),
          padding: EdgeInsets.all(20),
          elevation: 2,
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.deepOrange, width: 2),
          ),
        ),
        SizedBox(height: 10),
        MaterialButton(
          child: Text('Rounded Rectangle Border button'),
          onPressed: () =>
              showSnackBar(_ctx, 'Rounded Rectangle Border Button click'),
          padding: EdgeInsets.all(20),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.green, width: 2),
          ),
        ),
        SizedBox(height: 10),
        MaterialButton(
          child: Text('Stadium Border button'),
          onPressed: () => showSnackBar(_ctx, 'Stadium Border Button click'),
          padding: EdgeInsets.all(20),
          elevation: 2,
          shape: StadiumBorder(
            side: BorderSide(color: Colors.green, width: 2),
          ),
        ),
        SizedBox(height: 10),
        MaterialButton(
          child: Text('Beveled Rectangle Border button'),
          onPressed: () =>
              showSnackBar(_ctx, 'Beveled Rectangle Border Button click'),
          padding: EdgeInsets.all(20),
          elevation: 2,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.green, width: 2),
          ),
        ),
        SizedBox(height: 10),
        MaterialButton(
          child: Text('Outline Input Border button'),
          onPressed: () =>
              showSnackBar(_ctx, 'Outline Input Border Button click'),
          padding: EdgeInsets.all(20),
          elevation: 2,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.orange, width: 2)),
        ),
        SizedBox(height: 10),
        MaterialButton(
          child: Text('Underline InputBorder button'),
          onPressed: () =>
              showSnackBar(_ctx, 'Underline InputBorder Button click'),
          padding: EdgeInsets.all(20),
          elevation: 2,
          textColor: Colors.white,
          color: Colors.cyanAccent,
          shape: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
            borderSide: BorderSide(color: Colors.orange, width: 3),
          ),
        ),
        SizedBox(height: 10),
        MaterialButton(
          child: Text('Border all button'),
          onPressed: () => showSnackBar(_ctx, 'Border Button click'),
          padding: EdgeInsets.all(20),
          elevation: 2,
          shape: Border.all(width: 2.0, color: Colors.redAccent),
        ),
        SizedBox(height: 10),
        MaterialButton(
          child: Text('Circle'),
          onPressed: () => showSnackBar(_ctx, 'Circle button click'),
          padding: EdgeInsets.all(30),
          elevation: 2,
          textColor: Colors.blue,
          shape: CircleBorder(
              side: BorderSide(
                  color: Colors.blue, width: 2.0, style: BorderStyle.solid)),
        ),
      ],
    );
  }

  Widget getTextFieldType() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          color: ColorConst.RED_COLOR,
          height: 50,
          alignment: Alignment.center,
          child: getTxtWhiteColor('Text Field', 15, FontWeight.bold),
        ),
        SizedBox(height: 10),
        buildTextFied(context, 'Mobile number', ColorConst.APP_COLOR, false),
        SizedBox(height: 10),
        buildTextFied(context, 'Password', ColorConst.APP_COLOR, true),
        SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.send,
          textCapitalization: TextCapitalization.words,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w300),
          cursorColor: Colors.green,
//          cursorRadius: Radius.circular(16.0),
//          cursorWidth: 16.0,
          obscureText: true,
          maxLines: 1,
          maxLength: 20,
          decoration: InputDecoration(
              hintText: "All Demo Param",
              hintStyle:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
              errorStyle:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.red)),
        ),
        SizedBox(height: 10),
        TextField(
            decoration: InputDecoration(
          hintText: "PrefixIcon Input Field",
          icon: Icon(Icons.person_pin),
          hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
        )),
        SizedBox(height: 10),
        TextField(
            obscureText: _passwordVisible,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(),
              hintText: "Outline Input Border",
              suffixIcon: IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
              hintStyle:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
            )),
        SizedBox(height: 10),
        TextField(
            decoration: InputDecoration(
          hintText: "PrefixIcon Input Field",
          prefixIcon: Icon(Icons.call),
          hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
        )),
        SizedBox(height: 10),
        TextField(
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Email id",
          prefixIcon: Icon(Icons.email),
          labelText: 'Email',
          hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
        )),
        SizedBox(height: 10),
        TextField(
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Outline Input Border",
          hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
        )),
        SizedBox(height: 10),
        TextField(
            decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          border: OutlineInputBorder(
              gapPadding: 30, borderRadius: BorderRadius.circular(30)),
          hintText: "Outline Radius Input Border",
          hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
        )),
        SizedBox(height: 10),
        _normalDown(),
        SizedBox(height: 10),
      ],
    );
  }

  Widget getImageType() {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          color: ColorConst.APP_COLOR,
          height: 50,
          alignment: Alignment.center,
          child: getTxtWhiteColor('Image View', 15, FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(height: 150, child: loadImg(ApiConst.DEMO_IMG, 0)),
        SizedBox(height: 10),
        loadCircleImg(ApiConst.DEMO_IMG, 0, 120),
        SizedBox(height: 10),
        Container(height: 80, child: Image.asset(AssetsConst.LOGO_IMG)),
        SizedBox(height: 10),
        Container(
            height: 150,
            child: Image(
                image: AssetImage(AssetsConst.BABY_IMG), fit: BoxFit.cover)),
        SizedBox(height: 10),
        FadeInImage.assetNetwork(
            placeholder: AssetsConst.LOGO_IMG,
            image: ApiConst.DEMO_IMG,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover),
        SizedBox(height: 10),
//        FadeInImage.memoryNetwork(
//          placeholder: ,
//          image: ApiConstant.DEMO_IMG,
//          height: 200,
//          width: double.infinity,
//          fit: BoxFit.cover,
//        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget getProgressBarType() {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          color: ColorConst.RED_COLOR,
          height: 50,
          alignment: Alignment.center,
          child: getTxtWhiteColor('Progress bar', 15, FontWeight.bold),
        ),
        SizedBox(height: 10),
//        Stack(
//          alignment: Alignment.center,
//          children: <Widget>[
        Container(
          width: 100,
          child: CircleProgressBar(
            backgroundColor: Colors.grey,
            foregroundColor: Colors.blue,
            value: 0.70,
          ),
        ),
//            getTxtAppColor('${animation.value.toInt()} %', 25, FontWeight.bold)
//          ],
//        ),
        SizedBox(height: 10),
        LinearProgressIndicator(),
        SizedBox(height: 10),
        CircularProgressIndicator(),
        SizedBox(height: 10),
        CircularProgressIndicator(
          backgroundColor: Colors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.orange,
          ),
          value: 0.50,
        ),
        SizedBox(height: 10),
        LinearProgressIndicator(
          backgroundColor: Colors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.orange,
          ),
          value: 0.50,
        ),
        SizedBox(height: 10),
        _lineIndicator(),
        SizedBox(height: 10),
        _circleIndicator(),
        SizedBox(height: 10),
        _getSlider(),
        SizedBox(height: 10),
      ],
    );
  }
  DropdownButton _normalDown() => DropdownButton<String>(
    items: [
      DropdownMenuItem<String>(
        value: "First",
        child: Text(
          "First",
        ),
      ),
      DropdownMenuItem<String>(
        value: "Second",
        child: Text(
          "Second",
        ),
      ),
    ],
    onChanged: (value) {
      setState(() {
       showSnackBar(_ctx, value);
      });
    },
//    value: _value,
  );

  Widget getRatingBarType() {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          color: ColorConst.RED_COLOR,
          height: 50,
          alignment: Alignment.center,
          child: getTxtWhiteColor('Rating bar', 15, FontWeight.bold),
        ),
        SizedBox(height: 10),
        FlutterRatingBar(
          initialRating: 3,
          fillColor: Colors.blue,
          borderColor: Colors.blue.withAlpha(50),
          allowHalfRating: true,
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(height: 10),
        FlutterRatingBarIndicator(
          rating: 2.75,
          itemCount: 5,
          itemSize: 20.0,
          emptyColor: Colors.amber.withAlpha(50),
        ),
        SizedBox(height: 10),
        FlutterRatingBar(
          initialRating: 2.87,
          fillColor: Colors.blue,
          borderColor: Colors.grey,
          allowHalfRating: true,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          fullRatingWidget: _image(AssetsConst.RB_FULL_IMG),
          halfRatingWidget: _image(AssetsConst.RB_HALF_IMG),
          noRatingWidget: _image(AssetsConst.RB_EMPTY_IMG),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _image(String asset) {
    return Image.asset(
      asset,
      height: 30.0,
      width: 30.0,
      color: Colors.amber,
    );
  }

  _getDatePicker() {
    DatePicker.showDatePicker(context,
        theme: DatePickerTheme(
          containerHeight: 210.0,
        ),
        showTitleActions: true,
        minTime: DateTime(2000, 1, 1),
        maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
      print('confirm $date');
      _date = '${date.year} - ${date.month} - ${date.day}';
      setState(() {});
    }, currentTime: DateTime.now(), locale: LocaleType.en);
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
    DatePicker.showTimePicker(context,
        theme: DatePickerTheme(
          containerHeight: 210.0,
        ),
        showTitleActions: true, onConfirm: (time) {
      print('confirm $time');
      _time = '${time.hour} : ${time.minute} : ${time.second}';
      setState(() {});
    }, currentTime: DateTime.now(), locale: LocaleType.en);
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

  Widget getOtherType() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          color: ColorConst.RED_COLOR,
          height: 50,
          alignment: Alignment.center,
          child: getTxtWhiteColor('Other Widget', 15, FontWeight.bold),
        ),
        SizedBox(height: 10),
        getTxtAppColor(_date, 18, FontWeight.bold),
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
        getTxtAppColor(_time, 18, FontWeight.bold),
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
        getTxtAppColor(_resultRb, 18, FontWeight.bold),
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
        _getPopupMenu(),
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

  Widget _lineIndicator() => Container(
        constraints: BoxConstraints.expand(height: 10),
        child: LinearProgressIndicator(
          backgroundColor: Colors.grey,
          value: 0.50,
        ),
      );

  Widget _circleIndicator() => Container(
        constraints: BoxConstraints.expand(width: 100, height: 100),
        child: CircularProgressIndicator(
          value: 0.50,
          backgroundColor: Colors.grey,
//          valueColor: t.animate(_controller),
          strokeWidth: 10,
        ),
      );
Widget _getSlider(){
  return Slider(
    value: index < 0.0 ? 0.0 : index,
    min: 0.0,
    max: 100.0,
    onChanged: (double newValue) {
      print("newValue= $newValue");
      setState(() {
        index = newValue;
      });
    },
    label: "${index.round()} Dollar",
    onChangeStart: (value) {
      print("start = $value");
    },
    onChangeEnd: (endValue) {
      print("end = $endValue");
    },
    divisions: 100,
    semanticFormatterCallback: (value) {
      return "$value hello";
    },
  );
}
}
