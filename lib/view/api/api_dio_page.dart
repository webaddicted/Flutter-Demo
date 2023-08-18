import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/apiutils/api_response.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/UnSplashBean.dart';
import 'package:flutterbeginner/view/widgets/image_tile.dart';

class ApiDioPage extends StatefulWidget {
  const ApiDioPage({super.key});

  @override
  State<ApiDioPage> createState() => _ApiDioPageState();
}

class _ApiDioPageState extends State<ApiDioPage> {
  late BuildContext ctx;
  late Dio _dio;
  var perPage = 50;
  var page = 1;
  var keyword = 'Beautiful girls';
  List<Results>? unSplashBean;

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
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiConstant.BASE_URL,
      connectTimeout: const Duration(seconds: ApiConstant.TIME_OUT),
      receiveTimeout: const Duration(seconds: ApiConstant.TIME_OUT),
    );
    _dio = Dio(baseOptions);
    _dio.interceptors.add(LogInterceptor());
    var header = Options(headers: {
      'Authorization': 'Client-ID ${StringConst.unsplashClientId}',
    });
    _dio
        .get<String>(
      'https://api.unsplash.com/search/photos?query=$keyword&page=$page&per_page=$perPage&order_by=popular',
      options: header,
    )
        .then((response) {
          setState(() {
        unSplashBean = UnSplashBean.fromJson(jsonDecode(response.data!)).results!;
      });
    }).catchError((error) {
      printLog(msg: "Dio Error ${error.toString()}",status: ApiStatus.error);
    });
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    if (unSplashBean == null) return showPbIndicator();
    return OrientationBuilder(
        builder: (context, orientation) =>
            _buildImageGrid(orientation: orientation));
  }

  Widget _buildImageGrid({orientation = Orientation.portrait}) {
    int columnCount = orientation == Orientation.portrait ? 2 : 3;
    return GridView.builder(
        itemCount: unSplashBean?.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnCount,
          childAspectRatio: 1.5 / 2.5,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8
        ),
        itemBuilder: (BuildContext context, int index) {
          return Card(
              color: ColorConst.GREY_COLOR,
              child: ImageTile(unSplashBean![index].urls!.small!));
        }
    );
  }

}
