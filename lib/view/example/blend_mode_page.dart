import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class BlendModePage extends StatefulWidget {
  @override
  _BlendModePageState createState() => _BlendModePageState();
}

class _BlendModePageState extends State<BlendModePage> {
  late BuildContext _ctx;
  int? selectedBlendModeIndex = 0;

  Map<String, BlendMode> blendModeMap = Map();

  @override
  void initState() {
    super.initState();
    blendModeMap.putIfAbsent("Normal", () => BlendMode.clear);
    blendModeMap.putIfAbsent("Color Burn", () => BlendMode.colorBurn);
    blendModeMap.putIfAbsent("Color Dodge", () => BlendMode.colorDodge);
    blendModeMap.putIfAbsent("Saturation", () => BlendMode.saturation);
    blendModeMap.putIfAbsent("Hue", () => BlendMode.hue);
    blendModeMap.putIfAbsent("Soft light", () => BlendMode.softLight);
    blendModeMap.putIfAbsent("Overlay", () => BlendMode.overlay);
    blendModeMap.putIfAbsent("Multiply", () => BlendMode.multiply);
    blendModeMap.putIfAbsent("Luminosity", () => BlendMode.luminosity);
    blendModeMap.putIfAbsent("Plus", () => BlendMode.plus);
    blendModeMap.putIfAbsent("Exclusion", () => BlendMode.exclusion);
    blendModeMap.putIfAbsent("Hard Light", () => BlendMode.hardLight);
    blendModeMap.putIfAbsent("Lighten", () => BlendMode.lighten);
    blendModeMap.putIfAbsent("Screen", () => BlendMode.screen);
    blendModeMap.putIfAbsent("Modulate", () => BlendMode.modulate);
    blendModeMap.putIfAbsent("Difference", () => BlendMode.difference);
    blendModeMap.putIfAbsent("Darken", () => BlendMode.darken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(
            ctx: context, title: StringConst.BLEND_MODE_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return Stack(
      children: <Widget>[
        Image.asset(
          AssetsConst.BABY_IMG,
          height: double.maxFinite,
          width: double.maxFinite,
          fit: BoxFit.fitHeight,
          color: selectedBlendModeIndex == 0 ? null : Colors.red,
          colorBlendMode: selectedBlendModeIndex == 0
              ? null
              : blendModeMap.values.elementAt(selectedBlendModeIndex!),
        ),
        Positioned(
          left: 0.0,
          bottom: 0.0,
          height: 100.0,
          right: 0.0,
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 20.0),
                height: 40.0,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: blendModeMap.keys.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(4.0),
                      child: ChoiceChip(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 0.0),
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: (selectedBlendModeIndex == index)
                                  ? 15.0
                                  : 13.0,
                              fontWeight: (selectedBlendModeIndex == index)
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                          backgroundColor: Colors.black.withOpacity(0.8),
                          selectedColor: Colors.blue,
                          label: Center(
                            child: Text(blendModeMap.keys.elementAt(index)),
                          ),
                          selected: selectedBlendModeIndex == index,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedBlendModeIndex = selected ? index : null;
                            });
                          }),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
