import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/UnSplashBean.dart';
import 'package:flutterbeginner/view/widgets/image_tile.dart';

class ApiDioPage extends StatefulWidget {
  @override
  _ApiDioPageState createState() => _ApiDioPageState();
}

class _ApiDioPageState extends State<ApiDioPage> {
  BuildContext ctx;
  Dio _dio;
  var perPage = 50;
  var page = 1;
  var keyword = 'Beautiful girl';

  List<Results> unSplashBean;

  @override
  void initState() {
    super.initState();
    callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          getAppBarWithBackBtn(ctx: context, title: StringConst.UNSPLASH_TITLE),
      body: _createUi(context),
    );
  }

  callApi() async {
    BaseOptions baseOptions = new BaseOptions(
      baseUrl: ApiConstant.BASE_URL,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    _dio = Dio(baseOptions);
    _dio.interceptors.add(LogInterceptor());
    var header = Options(headers: {
      'Authorization':
          'Client-ID e993cde7a4d49aa482dd572dfca4dd27891fc573c4f5bed7f202e156e02b8e8e',
      // set content-length
    });
    _dio
        .get<String>(
      'https://api.unsplash.com/search/photos?query=$keyword&page=$page&per_page=$perPage&order_by=popular',
      options: header,
    )
        .then((r) {
      setState(() {
        unSplashBean = UnSplashBean.fromJson(jsonDecode(r.data)).results;
      });
    }).catchError(print);
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    if (unSplashBean == null) return showPbIndicator();
    return OrientationBuilder(
        builder: (context, orientation) =>
            _buildImageGrid(orientation: orientation));
  }

  Widget _buildImageGrid({orientation = Orientation.portrait}) {
    // calc columnCount based on orientation
    int columnCount = orientation == Orientation.portrait ? 2 : 3;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: columnCount,
        itemCount: unSplashBean.length,
        itemBuilder: (BuildContext context, int index) =>
            new Container(child: ImageTile(unSplashBean[index])),
        staggeredTileBuilder: (int index) =>
            _buildStaggeredTile(unSplashBean[index], columnCount),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
      ),
    );
  }

  StaggeredTile _buildStaggeredTile(Results image, int columnCount) {
    // calc image aspect ration
    double aspectRatio = image.height.toDouble() / image.width.toDouble();
    // calc columnWidth
    double columnWidth = MediaQuery.of(context).size.width / columnCount;
    // not using [StaggeredTile.fit(1)] because during loading StaggeredGrid is really jumpy.
    return StaggeredTile.extent(1, aspectRatio * columnWidth);
  }
}
