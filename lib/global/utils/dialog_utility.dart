
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckBoxDialog extends StatefulWidget {
  CustomCheckBoxDialog({
    this.cities,
    this.selectedCities,
    this.onSelectedCitiesListChanged,
  });

  final List<String> cities;
  final List<String> selectedCities;
  final ValueChanged<List<String>> onSelectedCitiesListChanged;

  @override
  _CustomCheckBoxDialogState createState() => _CustomCheckBoxDialogState();
}

class _CustomCheckBoxDialogState extends State<CustomCheckBoxDialog> {
  List<String> _tempSelectedCities = [];

  @override
  void initState() {
    _tempSelectedCities = widget.selectedCities;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('response[index].name'),
                    onTap: () {
                      widget.onSelectedCitiesListChanged(
                              _tempSelectedCities);
                    },
                  );
                },
              ),
            )
          ]
      ),
//      child: Column(
//        children: <Widget>[
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Text(
//                'CITIES',
//                style: TextStyle(fontSize: 18.0, color: Colors.black),
//                textAlign: TextAlign.center,
//              ),
//            ],
//          ),
//          Expanded(
//            child: ListView.builder(
//                itemCount: widget.cities.length,
//                itemBuilder: (BuildContext context, int index) {
//                  final cityName = widget.cities[index];
//                  return Container(
//                    child: CheckboxListTile(
//                        title: Text(cityName),
//                        value: _tempSelectedCities.contains(cityName),
//                        onChanged: (bool value) {
//                          if (value) {
//                            if (!_tempSelectedCities.contains(cityName)) {
//                              setState(() {
//                                _tempSelectedCities.add(cityName);
//                              });
//                            }
//                          } else {
//                            if (_tempSelectedCities.contains(cityName)) {
//                              setState(() {
//                                _tempSelectedCities.removeWhere(
//                                        (String city) => city == cityName);
//                              });
//                            }
//                          }
//                          widget.onSelectedCitiesListChanged(
//                              _tempSelectedCities);
//                        }),
//                  );
//                }),
//          ),
//        ],
//      ),
    );
  }
}



//class MyDialog extends StatefulWidget {
//  MyDialog({
//    this.cities,
//    this.selectedCities,
//    this.onSelectedCitiesListChanged,
//  });
//
//  final List<String> cities;
//  final List<String> selectedCities;
//  final ValueChanged<List<String>> onSelectedCitiesListChanged;
//
//  @override
//  MyDialogState createState() => MyDialogState();
//}
//
//class MyDialogState extends State<MyDialog> {
//  List<String> _tempSelectedCities = [];
//
//  @override
//  void initState() {
//    _tempSelectedCities = widget.selectedCities;
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Dialog(
//      child: Column(
//        children: <Widget>[
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Text(
//                'CITIES',
//                style: TextStyle(fontSize: 18.0, color: Colors.black),
//                textAlign: TextAlign.center,
//              ),
//            ],
//          ),
//          Expanded(
//            child: ListView.builder(
//                itemCount: widget.cities.length,
//                itemBuilder: (BuildContext context, int index) {
//                  final cityName = widget.cities[index];
//                  return Container(
//                    child: CheckboxListTile(
//                        title: Text(cityName),
//                        value: _tempSelectedCities.contains(cityName),
//                        onChanged: (bool value) {
//                          if (value) {
//                            if (!_tempSelectedCities.contains(cityName)) {
//                              setState(() {
//                                _tempSelectedCities.add(cityName);
//                              });
//                            }
//                          } else {
//                            if (_tempSelectedCities.contains(cityName)) {
//                              setState(() {
//                                _tempSelectedCities.removeWhere(
//                                        (String city) => city == cityName);
//                              });
//                            }
//                          }
//                          widget.onSelectedCitiesListChanged(
//                              _tempSelectedCities);
//                        }),
//                  );
//                }),
//          ),
//        ],
//      ),
//    );
//  }
//}
