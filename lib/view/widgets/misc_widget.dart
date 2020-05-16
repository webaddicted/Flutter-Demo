import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/random_widget.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/countries_bean.dart';

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
  List<CountryBean> _countryBean= List();
  int _selectedCountryIndex = 30;

  @override
  void initState() {
    super.initState();
    _getCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(context, StringConst.MISC_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
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
          child: getTxtWhiteColor('Other Widget', 15, FontWeight.bold),
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
        _cardView(),
        SizedBox(height: 10),
        (_countryBean == null || _countryBean.length == 0)
            ? Container()
            : selectCountryDropDown(
                _countryBean[_selectedCountryIndex], showCountries),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: SizedBox(
        height: 150,
        width: 300,
        child: Center(child: getTxtWhiteColor('message', 22, FontWeight.bold)),
      ),
    );
  }

  void _getCountry() async {
    _countryBean = await loadCountriesJson(context);
    setState(() {});
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
  showCountries() {
    showDialog(
        context: context,
        builder: (BuildContext context) => selectCountry(),
        //searchAndPickYourCountryHere(),
//        barrierDismissible: false
    );

//    showDialog(
//        context: context,
//        builder: (_) {
//          return MyDialog();
//        });

  }
  Widget selectCountry() {
    List<CountryBean> _searchResult = List();
    print("Dialog Start");
    TextEditingController _searchCountryController = TextEditingController();
    return Dialog(
        key: Key('SearchCountryDialog'),
        elevation: 8.0,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          margin: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, top: 8.0, bottom: 2.0, right: 8.0),
                child: Card(
                  child: TextFormField(
//                      autofocus: true,
                    controller: _searchCountryController,
                    onChanged: (text) {
                      print('on Change : '+text);
//                      _searchResult.clear();
                      if (text.isEmpty) {
                        setState(() {});
                        return;
                      }
                      _countryBean.forEach((userDetail) {
                        if (userDetail.name.toLowerCase().contains(
                            text.toLowerCase()) ||
                            userDetail.dialCode.toString().contains(text))
                          _searchResult.add(userDetail);
                      });
                      setState(() {});
                    }, // onSearchTextChanged,
                    decoration: InputDecoration(
                        hintText: 'Search your country',
                        contentPadding: const EdgeInsets.only(
                            left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
                        border: InputBorder.none),
                  ),
                ),
              ),
              Expanded(
                  child: _searchResult.length != 0 ||
                      _searchCountryController.text.isNotEmpty
                      ? _buildSearchResults(_searchResult)
                      : _buildSearchResults(_countryBean)),
            ],
          ),
        ),
      );
  }
//  onSearchTextChanged(String text) async {
//    _searchResult.clear();
//    if (text.isEmpty) {
//      setState(() {});
//      return;
//    }
//
//    _countryBean.forEach((userDetail) {
//      if (userDetail.name.toLowerCase().contains(text.toLowerCase()) ||
//          userDetail.dialCode.toString().contains(text))
//        _searchResult.add(userDetail);
//    });
//
//    setState(() {});
//  }

  Widget _buildSearchResults(List<CountryBean> country) {
    print('List : ');
    return new ListView.builder(
      itemCount: country.length,
      itemBuilder: (context, index) {
        return  Material(
          color: Colors.white,
          type: MaterialType.canvas,
          child: InkWell(
            onTap: () => selectThisCountry(country[index]), //selectThisCountry(country),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
              child: Text(
                "  " +
                    country[index].flag +
                    "  " +
                    country[index].name +
                    " (" +
                    country[index].dialCode +
                    ")",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        );
      },
    );
  }
  void selectThisCountry(CountryBean country) {
    print(country);
    Navigator.of(context).pop();
    Future.delayed(Duration(milliseconds: 10)).whenComplete(() {
      setState(() {
        _selectedCountryIndex = _countryBean.indexOf(country);
      });
    });
  }

}
