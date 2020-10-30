import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterbeginner/global/apiutils/api_response.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/BooksRespo.dart';
import 'package:flutterbeginner/model/bean/UnSplashBean.dart';
import 'package:flutterbeginner/provider/movie_provider.dart';
import 'file:///D:/AndroidStudioProjects/flutter/flutterbeginner/lib/view/pulltorefresh/pull_to_refresh.dart';
import 'package:flutterbeginner/view/widgets/image_tile.dart';
import 'package:flutterbeginner/view/widgets/tranding_movie_row.dart';
import 'package:provider/provider.dart';

class ApiDioArchPage extends StatefulWidget {
  @override
  _ApiDioArchPageState createState() => _ApiDioArchPageState();
}

class _ApiDioArchPageState extends State<ApiDioArchPage> {
  BuildContext ctx;
  Dio _dio;
  var perPage = 50;
  var page = 1;
  MovieProvider movieData;
  List<Items> bookItemBean;

  @override
  void initState() {
    super.initState();
    movieData = MovieProvider();
    movieData.fetchBookList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.DIO_ARCHITECTURE_TITLE),
      body: ChangeNotifierProvider<MovieProvider>(
          create: (BuildContext context) => movieData, child: BookItem()),
    );
  }
}

class BookItem extends StatelessWidget {
  MovieProvider appState;

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<MovieProvider>(context);
    return RefreshIndicator(
        onRefresh: () => appState.fetchMovieList(),
        child: apiresponse(context));
  }

  Widget apiresponse(BuildContext context) {
    var jsonResult = appState.getBookRespo;
    if (jsonResult.status == ApiStatus.COMPLETED) {
      debugPrint("COMPLETED");
      List<Items> bookRespo = jsonResult.data.items;
      return _createUi(context, bookRespo);
    } else
      return apiHandler(response: jsonResult);
  }

  Widget _createUi(BuildContext context, List<Items> bookRespo) {
    return OrientationBuilder(
        builder: (context, orientation) =>
            _buildImageGrid(bookRespo, ctx: context, orientation: orientation));
  }

  Widget _buildImageGrid(List<Items> booksRspo,
      {BuildContext ctx, orientation = Orientation.portrait}) {
    int columnCount = orientation == Orientation.portrait ? 2 : 3;
    return GridView.builder(
      itemCount: booksRspo.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnCount,
        childAspectRatio: 1.5 / 1.8,
      ),
      itemBuilder: (context, index) {
        String img = '';
        try {
          img =booksRspo[index].volumeInfo.imageLinks
              .thumbnail.toString();
          print(
              'Thumbnail  : $index     ${booksRspo[index].volumeInfo.imageLinks
                  .thumbnail.toString()}');
        }catch(error){
          img = '';
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CachedNetworkImage(
                placeholder: (context, url) => Container(color: Colors.grey,),
                imageUrl : img,
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }

  StaggeredTile _buildStaggeredTile(BuildContext ctx, int columnCount) {
    Size size = MediaQuery.of(ctx).size;
    // calc image aspect ration
    double aspectRatio = size.height / (columnCount + 2);
    // calc columnWidth
    double columnWidth = size.width / columnCount;
    // not using [StaggeredTile.fit(1)] because during loading StaggeredGrid is really jumpy.
    return StaggeredTile.extent(1, aspectRatio * columnWidth);
  }
}
