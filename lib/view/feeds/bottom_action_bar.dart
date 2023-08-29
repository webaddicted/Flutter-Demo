import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/view/feeds/news_model.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:inshort_clone/controller/provider.dart';
// import 'package:inshort_clone/model/news_model.dart';
// import 'package:inshort_clone/services/news/offline_service.dart';
// import 'package:inshort_clone/services/news/share_service.dart';
// import 'package:inshort_clone/style/colors.dart';
// import 'package:inshort_clone/style/text_style.dart';


// import '../../../aplication_localization.dart';

class BottomActionBar extends StatelessWidget {
  final containerKey;
  final Articles? articles;

  const BottomActionBar({
    Key? key,
    this.containerKey,
    this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          actionButton(
            title: "share",
            icon: Icons.share,
            onTap: () {
              // Provider.of<FeedProvider>(context, listen: false)
              //     .setWatermarkVisible(true);
              //
              // Future.delayed(Duration(seconds: 2),
              //     () => convertWidgetToImageAndShare(context, containerKey));
            },
          ),
          // WatchBoxBuilder(
          //   box: Hive.box<Articles>('bookmarks'),
          //   builder: (context, snap) =>
                actionButton(
              title: "bookmark",
              icon: Icons.bookmark,
                  // : FeatherIcons.bookmark,
              onTap: () {
                // handleBookmarks(articles);
              },
            ),
          // )
        ],
      ),
    );
  }

  Widget actionButton({
    required String title,
    required IconData icon,
    required Function onTap,
  }) {
    return InkWell(
      onTap: onTap(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: ColorConst.greyShade,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            // style: AppTextStyle.bottomActionbar,
          ),
        ],
      ),
    );
  }
}
