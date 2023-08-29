import 'dart:ui';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/feeds/bottom_action_bar.dart';
import 'package:flutterbeginner/view/feeds/bottom_bar.dart';
import 'package:flutterbeginner/view/feeds/news_model.dart';

class NewsCard extends StatelessWidget {
  final Articles article;
  final bool isFromSearch;

  const NewsCard({Key? key, required this.article, required this.isFromSearch}) : super(key: key);

  @override
  build(BuildContext context) {
    // print(article.url);
    return GestureDetector(
      onTap: () {
      },
      child: SafeArea(
        bottom: false,
        child: _buildCard(context),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    GlobalKey _containerKey = GlobalKey();
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          constraints: BoxConstraints(
            minHeight:700,
            minWidth: double.maxFinite,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.3),
          ),
          child: RepaintBoundary(
            key: _containerKey,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    // heightFactor: 0.8,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        article.url != null
                            ? Container(
                                decoration: BoxDecoration(
                                  color: ColorConst.greyShade,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      article.url!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
                                color: ColorConst.greyShade,
                              ),
                        Positioned(
                          top: 0,
                          left: 0,
                          height: double.maxFinite,
                          width: double.maxFinite,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                        ),
                        article.url != null
                            ? GestureDetector(
                          //TODO UNDO
                          //       child: Center(
                          //         child: CachedNetworkImage(
                          //           fit: BoxFit.fill,
                          //           alignment: Alignment.topCenter,
                          //           imageUrl: article.url,
                          //         ),
                          //       ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.6,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        FractionallySizedBox(
                          alignment: Alignment.topCenter,
                          heightFactor: 0.85,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 25, 16, 16),
                            child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  GestureDetector(
                                    child: Text(
                                      article.title!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  getTxtWhiteColor(msg: article.description!),
                                  // Text(
                                  //   article.description != null
                                  //       ? article.description
                                  //       : "",
                                  //   overflow: TextOverflow.fade,
                                  //   maxLines: 9,
                                  // ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "${"swipe_message"} ${article.sourceName} / ",
                                  )
                                ],
                              ),
                          ),
                        ),
                        FractionallySizedBox(
                          alignment: Alignment.bottomCenter,
                          heightFactor: 0.15,
                          child: BottomBar(
                            articles: article,
                          ),
                        ),
                        FractionallySizedBox(
                                alignment: Alignment.bottomCenter,
                                heightFactor: 0.15,
                                child: BottomActionBar(
                                  containerKey: _containerKey,
                                  articles: article,
                                )),
                        FractionallySizedBox(
                                alignment: Alignment.bottomCenter,
                                heightFactor: 0.17,
                                child: Material(
                                  elevation: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            SizedBox(width: 8),
                                            Text("github/webaddicted"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                             AssetsConst.logoImg,
                                              height: 20,
                                              width: 20,
                                            ),
                                            SizedBox(width: 8),
                                            Text("Inshorts Clone"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
