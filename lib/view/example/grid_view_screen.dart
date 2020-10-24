import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class GridViewScreen extends StatefulWidget {
  @override
  _GridViewScreenState createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  BuildContext ctx;
  var listData = List<String>();

  @override
  void initState() {
    super.initState();
    getLocalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            getAppBarWithBackBtn(ctx: context, title: StringConst.GRID_TITLE),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getLocalData();
          },
          child: Icon(Icons.refresh, color: Colors.white),
        ),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    if (listData == null || listData.length == 0) return showPbIndicator();
    return Container(
        alignment: Alignment.center,
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(4.0),
          childAspectRatio: 8.0 / 9.0,
          children: listData
              .map(
                (String) => GridRow(item: String),
              )
              .toList(),
        ));
  }

  void getLocalData() async {
    if (listData != null) listData.clear();
    listData.add('WhatsApp Video');
    listData.add('WhatsApp Animation');
    listData.add('Punjabi Song');
    listData.add('Tubemate Video');
    listData.add('Latest hit Video');
    listData.add('Movies');
    listData.add('DDLG');
    listData.add('Lazy lamhe');
    listData.add('My life my rule');
    setState(() {});
  }
}

class GridRow extends StatelessWidget {
  final String item;

  const GridRow({@required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => GridItemDetails(this.item),
//          ),
//        );
      },
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 12.0,
              child: Image.asset(
                AssetsConst.BABY_IMG,
                fit: BoxFit.cover,
              ),
//              loadImg(ApiConst.DEMO_IMG, 0),
            ),
            new Padding(
              padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0xFFD73C29),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'item.category',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 9.0,
                    ),
                  ),
                  SizedBox(height: 0.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 4.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'RELEASE DATE:',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 9.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'item.releaseDate',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 9.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 4.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'RUNTIME:',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 9.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'item.runtime',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 9.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
