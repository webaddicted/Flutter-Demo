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
  List<CountryBean> _countryBean;
  StreamController<List<CountryBean>> _countriesStreamController;
  Stream<List<CountryBean>> _countriesStream;
  Sink<List<CountryBean>> _countriesSink;
  TextEditingController _searchCountryController = TextEditingController();

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
    return new Container(
        padding: EdgeInsets.all(5.0),
        child: new Center(
          child: SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                _getRatingBarType(),
                _getOtherWidget(),
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
        selectCountryDropDown(_countryBean[_selectedCountryIndex], showCountries),
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

  showCountries() {
    /*
     * Initialising components required for StreamBuilder
     * We will not be using _countriesStreamController anywhere, but just to initialize Stream & Sink from that
     * _countriesStream will give us the data what we need(output) - that will be used in StreamBuilder widget
     * _countriesSink is the place where we send the data(input)
     */
    _countriesStreamController = StreamController();
    _countriesStream = _countriesStreamController.stream;
    _countriesSink = _countriesStreamController.sink;
    _countriesSink.add(_countryBean);

    _searchCountryController.addListener(searchCountries);

    showDialog(
        context: context,
        builder: (BuildContext context) => searchAndPickYourCountryHere(),
        barrierDismissible: false);
  }
  searchCountries() {
    String query = _searchCountryController.text;
    if (query.length == 0 || query.length == 1) {
      if (!_countriesStreamController.isClosed)
        _countriesSink.add(_countryBean);
    } else if (query.length >= 2 && query.length <= 5) {
      List<CountryBean> searchResults = [];
      searchResults.clear();
      _countryBean.forEach((CountryBean c) {
        if (c.toString().toLowerCase().contains(query.toLowerCase()))
          searchResults.add(c);
      });
      _countriesSink.add(searchResults);
//      print('added few countries based on search ${searchResults.length}');
    } else {
      List<CountryBean> searchResults = [];
      _countriesSink.add(searchResults);
    }
  }
  Widget searchAndPickYourCountryHere() => WillPopScope(
        onWillPop: () => Future.value(false),
        child: Dialog(
          key: Key('SearchCountryDialog'),
          elevation: 8.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                searchCountry(_searchCountryController),
                SizedBox(
                  height: 300.0,
                  child: StreamBuilder<List<CountryBean>>(
                      stream: _countriesStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          // print(snapshot.data.length);
                          return snapshot.data.length == 0
                              ? Center(
                                  child: Text('Your search found no results',
                                      style: TextStyle(fontSize: 16.0)),
                                )
                              : ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context, int i) =>
                                      selectableWidget(
                                          snapshot.data[i],
                                          (CountryBean c) =>
                                              selectThisCountry(c)),
                                );
                        } else if (snapshot.hasError)
                          return Center(
                            child: Text('Seems, there is an error',
                                style: TextStyle(fontSize: 16.0)),
                          );
                        return Center(child: CircularProgressIndicator());
                      }),
                )
              ],
            ),
          ),
        ),
      );

  void selectThisCountry(CountryBean country) {
    print(country);
    _searchCountryController.clear();
    Navigator.of(context).pop();
    Future.delayed(Duration(milliseconds: 10)).whenComplete(() {
      _countriesStreamController.close();
      _countriesSink.close();
      setState(() {
        _selectedCountryIndex = _countryBean.indexOf(country);
      });
    });
  }
}
