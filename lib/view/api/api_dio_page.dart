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
  List dataResult;
  BuildContext ctx;
  bool isLoading = false;
  Dio _dio;
  var perPage = 50;
  var page = 1;
  var keyword = 'beautiful girl';

  List<Results> unSplashBean;

  @override
  void initState() {
    super.initState();
    callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(
            ctx: context, title: StringConst.UNSPLASH_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
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
        print(r.data);
      });
    }).catchError(print);
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    if (unSplashBean == null) return showPbIndicator();
    return _buildImageGrid();
  }

  Widget _buildImageGrid({orientation = Orientation.portrait}) {
    // calc columnCount based on orientation
    int columnCount = orientation == Orientation.portrait ? 2 : 3;
    // return staggered grid
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverStaggeredGrid.countBuilder(
        // set column count
        crossAxisCount: columnCount,
        itemCount: unSplashBean.length,
        // set itemBuilder
        itemBuilder: (BuildContext context, int index) =>
            ImageTile(unSplashBean[0]),
        //_buildImageItemBuilder(index),
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
// Widget _buildImageItemBuilder(int index) => FutureBuilder(
//   // pass image loader
//   future: _loadImage(index),
//   builder: (context, snapshot) =>
//   // image loaded return [_ImageTile]
//   ImageTile(snapshot.data),
// );

// Future<UnSplashBean> _loadImage(int index) async {
//   // check if new images need to be loaded
//   if (index >= unSplashBean.length - 2) {
//     // Reached the end of the list. Try to load more images.
//     _loadImages(keyword: keyword);
//   }
//
//   return index < images.length ? images[index] : null;
// }

}
