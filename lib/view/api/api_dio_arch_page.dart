import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/apiutils/api_response.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/BooksRespo.dart';
import 'package:flutterbeginner/provider/movie_provider.dart';
import 'package:flutterbeginner/view/widgets/image_tile.dart';
import 'package:provider/provider.dart';

class ApiDioArchPage extends StatefulWidget {
  @override
  State<ApiDioArchPage> createState() => _ApiDioArchPageState();
}

class _ApiDioArchPageState extends State<ApiDioArchPage> {
  late BuildContext ctx;
  var perPage = 50;
  var page = 1;
  late MovieProvider movieData;
  late List<Items> bookItemBean;

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
  late MovieProvider appState;

  BookItem({super.key});

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<MovieProvider>(context);
    return RefreshIndicator(
        onRefresh: () => appState.fetchMovieList(),
        child: apiResponse(context));
  }

  Widget apiResponse(BuildContext context) {
    var jsonResult = appState.getBookRespo;
    if (jsonResult!.status == ApiStatus.success) {
      printLog(msg: "COMPLETED");
      List<Items> bookRespo = jsonResult.data!.items!;
      return _createUi(context, bookRespo);
    } else {
      return apiHandler(response: jsonResult);
    }
  }

  Widget _createUi(BuildContext context, List<Items> bookRespo) {
    return OrientationBuilder(
        builder: (context, orientation) =>
            _buildImageGrid(bookRespo, ctx: context, orientation: orientation));
  }

  Widget _buildImageGrid(List<Items> booksRspo,
      {BuildContext? ctx, orientation = Orientation.portrait}) {
    int columnCount = orientation == Orientation.portrait ? 2 : 3;
    return GridView.builder(
      itemCount: booksRspo.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnCount,
          childAspectRatio: 1.5 / 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 2),
      itemBuilder: (context, index) {
        String img = '';
        try {
          img = booksRspo[index].volumeInfo!.imageLinks!.thumbnail.toString();
        } catch (error) {
          img = '';
        }
        return Card(
          color: ColorConst.GREY_COLOR,
          child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ImageTile(img)),
        );
      },
    );
  }
}
