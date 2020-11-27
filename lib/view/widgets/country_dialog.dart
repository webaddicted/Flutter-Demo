import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/countries_bean.dart';

/**
 * Author : Deepak Sharma(Webaddicted)
 * Email : deepaksharmatheboss@gmail.com
 * Profile : https://github.com/webaddicted
 */
class CountryDialog extends StatefulWidget {
  final List<CountryBean> countries;
  final Function(CountryBean) onCellTap;

  const CountryDialog({@required this.countries, this.onCellTap});
  @override
  _CountryDialogState createState() => _CountryDialogState();
}

class _CountryDialogState extends State<CountryDialog> {
  List<CountryBean> _countries;
  TextEditingController _controller;
  Size _size;

  @override
  void initState() {
    _countries = widget.countries;
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      contentPadding: EdgeInsets.zero,
      title: Theme(
        child: TextField(
          controller: _controller,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            prefixStyle: TextStyle(color: Colors.black, fontSize: 35),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black87),
            ),
          ),
          onChanged: (str) {
            _countries = widget.countries
                .where((e) => (e.name.toUpperCase().contains(str.toUpperCase()))||e.dialCode.toUpperCase().contains(str.toUpperCase()))
                .toList();
            setState(() {});
          },
        ),
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black87,
        ),
      ),
      children: <Widget>[
        Container(
          height: _size.height-10,
          width: _size.width-20,
          child: ListView.separated(
            padding: EdgeInsets.all(15),
            separatorBuilder: (_, __) => Divider(
              height: 25,
            ),
            itemCount: _countries.length,
            itemBuilder: (_, index) {
              final d = _countries[index];
              return _CountryCell(
                data: d,
                onTap: widget.onCellTap,
              );
            },
          ),
        )
      ],
    );
  }
}

class _CountryCell extends StatelessWidget {
  final CountryBean data;
  final Function(CountryBean) onTap;

  _CountryCell({this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: ValueKey(data.name),
      onTap: () {
        onTap(data);
        Navigator.of(context).pop();
      },
      child: Container(
        child: Row(
          children: <Widget>[
            getTxtBlackColor(msg:data.flag, fontSize: 22),
            SizedBox(width: 10),
            getTxtBlackColor(msg:' (${data.dialCode}) ', fontSize: 16),
            Expanded(child: getTxtBlackColor(msg:data.name, fontSize: 16, maxLines: 1)),

          ],
        ),
      ),

    );
  }
}