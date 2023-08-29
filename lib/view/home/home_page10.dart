import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';
import 'package:flutterbeginner/view/feeds/discover/interest_screen.dart';
import 'package:flutterbeginner/view/feeds/feed.dart';
import 'package:flutterbeginner/view/feeds/news_model.dart';
import 'package:flutterbeginner/view/local/video/video_screen.dart';
import 'package:flutterbeginner/view/profile/profile_page9.dart';

class HomePage10 extends StatefulWidget {
  @override
  _HomePage10State createState() => _HomePage10State();
}

class _HomePage10State extends State<HomePage10> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late BuildContext ctx;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: getAppBarWithBackBtn(
      //     ctx: context, title: StringConst.HOME_TITLE),
      bottomNavigationBar: Material(
        color: ColorConst.whiteColor,
        shadowColor: ColorConst.appColor,
        child: _getTab(),
      ),
      body: _createUi(context),
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        FeedScreen(articalIndex: 0, articals: getArticle(), isFromSearch: true),
        VideoScreen(),
        InterestScreen(),
        ProfilePage9(),
      ],
    );
  }

  TabBar _getTab() {
    return TabBar(
      indicatorColor: ColorConst.appColor,
      unselectedLabelColor: ColorConst.blackColor,
      labelColor: ColorConst.appColor,
      controller: _tabController,
      tabs: const <Widget>[
        Tab(
          icon: Icon(Icons.home_filled),
          text:  "Home",
        ),
        Tab(
          icon: Icon(Icons.video_collection_outlined),
          text:  "Video",
        ),
        Tab(
          icon: Icon(Icons.content_paste),
          text:  "Artical",
        ),
        Tab(          icon: Icon(Icons.person),
          text:  "Profile",
        ),

      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  getArticle() {
    List<Articles>art=[];
    for(int i =0; i<dummyLargeImg.length;i++){
      Articles articles= Articles();
      articles.sourceName="Webaddicted";
      articles.author="Deepak Sharma";
      articles.title="Apna Time Aaayega";
      articles.description=StringConst.DUMMY_LAGE_TEXT;
      articles.url=dummyLargeImg[i];
      articles.urlToImage=ApiConstant.DEMO_IMG;
      articles.publishedAt="Published At fghgfgh";
      articles.content="Content fghgfgh";
      art.add(articles);
    }
    return art;
  }
}

class FirstPage extends StatelessWidget {
  String title = '';

  FirstPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Center(
        child: getTxtBlackColor(msg: title, fontWeight: FontWeight.bold),
      ),
    );
  }
}
