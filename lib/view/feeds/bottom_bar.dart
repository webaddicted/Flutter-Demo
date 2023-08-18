import 'dart:ui';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/view/feeds/news_model.dart';

class BottomBar extends StatelessWidget {
  final Articles articles;

  const BottomBar({Key? key, required this.articles}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) =>
      //         WebScreen(url: articles.url, isFromBottom: true),
      //   ),
      // ),
      child: Container(
        color: Theme.of(context).cardColor,
        // elevation: 0,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              child:
              //TODO UNDO
              // articles.urlToImage != null
              //     ? CachedNetworkImage(
              //         imageUrl: articles.urlToImage,
              //         fit: BoxFit.cover,
              //         alignment: Alignment.center,
              //       )
              //     :
              Container(),
            ),
            Positioned(
              top: 0,
              left: 0,
              height: double.maxFinite,
              width: double.maxFinite,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              color: ColorConst.GREEN_COLOR.withOpacity(0.6),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    articles.content != null
                        ? articles.content!.split(",")[0].replaceAll("\n", "")
                        : "",
                    maxLines: 1,
                    // style: AppTextStyle.newsBottomTitle,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                   "tap_message",
                    // style: AppTextStyle.newsBottomSubtitle,
                    overflow: TextOverflow.fade,
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
