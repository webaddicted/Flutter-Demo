import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/countries_bean.dart';
import 'package:flutterbeginner/view/widgets/country_dialog.dart';
import 'package:flutterbeginner/global/utils/validation_helper.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late BuildContext _ctx;
  bool _passwordVisible = false;
  late List<CountryBean> _countryBean;

  @override
  void initState() {
    super.initState();
    _loadCountriesJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(
            ctx: context, title: StringConst.TEXT_FIELD_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return Container(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _getTextFieldType(),
              ],
            ),
          ),
        ));
  }

  Widget _getTextFieldType() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Material(
            elevation: 5.0,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: TextField(
              // controller: TextEditingController(text: locations[0]),
              cursorColor: Theme.of(context).primaryColor,
              decoration: const InputDecoration(
                  hintText: "Search School",
                  hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
                  prefixIcon: Material(
                    elevation: 0.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Icon(Icons.search),
                  ),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3.0,
                  offset: Offset(1.0, 1.0))
            ],
          ),
          child: edtMobileNoField(TextEditingController()),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.all(5),
          child: Material(
            elevation: 5.0,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: TextField(
              controller: TextEditingController(text: 'Search...'),
              cursorColor: Theme.of(context).primaryColor,
              style: const TextStyle(color: Colors.black, fontSize: 18),
              decoration: const InputDecoration(
                  suffixIcon: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Icon(Icons.search),
                  ),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
            ),
          ),
        ),
        const SizedBox(height: 10),
        selectCountryDropDown(
            CountryBean(name: "India", flag: "🇮🇳 (+91) "), onPressed),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3.0,
                  offset: Offset(1.0, 1.0))
            ],
          ),
          child: TextFormField(
            // controller: mobileNoCont,
            textInputAction: TextInputAction.next,
            // maxLines: 1,
            // maxLength: 10,
            keyboardType: TextInputType.number,
            validator: ValidationHelper.validateMobile,
            decoration: InputDecoration(
              border: InputBorder.none,
              // fillColor: Colors.transparent,
              hintText: 'Phone Number',
              contentPadding: const EdgeInsets.only(top: 15),
              prefixIcon: InkWell(
                  onTap: () => showDialog(
                      context: context,
                      builder:(_) =>  CountryDialog(
                        countries: _countryBean,
                        onCellTap: (CountryBean countryBean) {},
                      )),
                  child: SizedBox(
                    width: 100,
                    child: Center(
                      child: getTxtBlackColor(msg: '🇮🇳 (+91) ', fontSize: 17),
                    ),
                  )),
            ),
          ),
        ),
        const SizedBox(height: 10),
        _buildBottomBar(),
        const SizedBox(height: 10),
        edtMobileNoField(TextEditingController()),
        const SizedBox(height: 10),
        edtPwdField(TextEditingController(), _passwordVisible, pwdVisClick),
//        buildTextFied(context, 'Password', ColorConst.APP_COLOR, true),
        const SizedBox(height: 10),
        const TextField(
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
        const SizedBox(height: 10),
        const TextField(
            decoration: InputDecoration(
          hintText: "PrefixIcon Input Field",
          icon: Icon(Icons.person_pin),
          hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
        )),
        const SizedBox(height: 10),

        TextField(
            obscureText: _passwordVisible,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              border: const OutlineInputBorder(),
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
                  const TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
            )),
        const SizedBox(height: 10),
        const TextField(
            decoration: InputDecoration(
          hintText: "PrefixIcon Input Field",
          prefixIcon: Icon(Icons.call),
          hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
        )),
        const SizedBox(height: 10),
        const TextField(
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Email id",
          prefixIcon: Icon(Icons.email),
          labelText: 'Email',
          hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
        )),
        const SizedBox(height: 10),
        const TextField(
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Outline Input Border",
          hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
        )),
        const SizedBox(height: 10),
        TextField(
            decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          border: OutlineInputBorder(
              gapPadding: 30, borderRadius: BorderRadius.circular(30)),
          hintText: "Outline Radius Input Border",
          hintStyle: const TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
        )),
        const SizedBox(height: 10),
        buildDropdownButton(['Black', 'Blue', 'Red'], 'Black'),
        const SizedBox(height: 10),
      ],
    );
  }

  pwdVisClick() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  Widget selectCountryDropDown(CountryBean country, Function onPressed) {
    return Card(
      child: InkWell(
        onTap: onPressed(),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 4.0, right: 4.0, top: 12.0, bottom: 12.0),
          child: Row(
            children: <Widget>[
              Expanded(child: Text(' ${country.flag}  ${country.name} ')),
              const Icon(Icons.arrow_drop_down, size: 24.0)
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize _buildBottomBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search Item',
                icon: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                suffixIcon:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.mic))),
          ),
        ),
      ),
    );
  }

  Widget buildDropdownButton(List<String> items, String selectedValue) {
    return DropdownButton<String>(
      isExpanded: true,
      value: selectedValue,
      onChanged: (_) {},
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Future<List<CountryBean>> _loadCountriesJson() async {
    _countryBean = [];
    var value = await DefaultAssetBundle.of(context)
        .loadString(AssetsConst.countryPhoneCodesJson);
    var countriesJson = json.decode(value);
    for (var country in countriesJson) {
      _countryBean.add(CountryBean.fromJson(country));
    }
    printLog(msg: "object" + _countryBean.toString());
    setState(() {});
    return _countryBean;
  }

  onPressed() {
    showDialog(
        context: context,
        builder:(_) => CountryDialog(
          countries: _countryBean,
          onCellTap: (CountryBean countryBean) {},
        ));
  }
}
