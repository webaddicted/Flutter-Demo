import 'package:flutter/material.dart';
import 'package:flutterbeginner/view/feeds/discover/app_bar.dart';
import 'package:flutterbeginner/view/feeds/discover/category_card.dart';
import 'package:flutterbeginner/view/feeds/discover/headline.dart';
import 'package:flutterbeginner/view/feeds/discover/topics_card.dart';


class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  var bloc;

  @override
  void initState() {
    // bloc = BlocProvider.of<NewsFeedBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<FeedProvider>(context, listen: false);
    // provider.setAppBarVisible(true);

    return Scaffold(
      appBar: appSearchBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            headLine("Categories"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: <Widget>[
                      CategoryCard(
                        title:
                            "my_feed",
                        icon: "all",
                        active: true,
                        onTap: () {
                          // provider.setActiveCategory(1);
                          // provider.setAppBarTitle(AppLocalizations.of(context)
                          //     .translate("my_feed"));

                          // bloc.add(
                          //   FetchNewsByCategoryEvent(category: "general"),
                          // );
                        },
                      ),
                      CategoryCard(
                        title:
                           "trending",
                        icon: "trending",
                        active: true,
                        onTap: () {
                          // provider.setActiveCategory(2);
                          // provider.setAppBarTitle(AppLocalizations.of(context)
                          //     .translate("trending"));
                          //
                          // bloc.add(
                          //   FetchNewsByTopicEvent(topic: "trending"),
                          // );
                        },
                      ),
                      CategoryCard(
                        title:
                            "bookmark",
                        icon: "bookmark",
                        active: true,
                        onTap: () {
                          // provider.setActiveCategory(3);
                          // provider.setAppBarTitle(AppLocalizations.of(context)
                          //     .translate("bookmark"));
                          //
                          // bloc.add(
                          //   FetchNewsFromLocalStorageEvent(box: 'bookmarks'),
                          // );
                        },
                      ),
                      CategoryCard(
                        title:
                            "unreads",
                        icon: "unread",
                        active: true,//provider.getActiveCategory == 4,
                        onTap: () {
                          // provider.setActiveCategory(4);
                          // provider.setAppBarTitle(AppLocalizations.of(context)
                          //     .translate("unreads"));
                          //
                          // bloc.add(
                          //   FetchNewsFromLocalStorageEvent(box: 'unreads'),
                          // );
                        },
                      ),
                    ],
                  ),

              ),
            ),
            SizedBox(
              height: 16,
            ),
            headLine("Sugested Topics"),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: (1 / 1.4),
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: <Widget>[
                  TopicCard(
                    title:
                        "coronavirus",
                    icon: "coronavirus",
                    onTap: () {
                      // provider.setAppBarTitle(AppLocalizations.of(context)
                      //     .translate("coronavirus"));
                      // FeedController.addCurrentPage(1);
                      // bloc.add(
                      //   FetchNewsByTopicEvent(topic: "coronavirus"),
                      // );
                    },
                  ),
                  TopicCard(
                    title: "india",
                    icon: "india",
                    onTap: () {
                      // provider.setAppBarTitle(
                      //     AppLocalizations.of(context).translate("india"));
                      // FeedController.addCurrentPage(1);
                      // bloc.add(
                      //   FetchNewsByTopicEvent(topic: "india"),
                      // );
                    },
                  ),
                  TopicCard(
                    title: "business",
                    icon: "business",
                    onTap: () {
                      // provider.setAppBarTitle(
                      //     AppLocalizations.of(context).translate("business"));
                      // FeedController.addCurrentPage(1);
                      // bloc.add(
                      //   FetchNewsByCategoryEvent(category: "business"),
                      // );
                    },
                  ),
                  TopicCard(
                    title: "politics",
                    icon: "politics",
                    onTap: () {
                      // provider.setAppBarTitle(
                      //     AppLocalizations.of(context).translate("politics"));
                      // FeedController.addCurrentPage(1);
                      // bloc.add(
                      //   FetchNewsByTopicEvent(topic: "politics"),
                      // );
                    },
                  ),
                  TopicCard(
                    title: "sports",
                    icon: "sports",
                    onTap: () {
                      // provider.setAppBarTitle(
                      //     AppLocalizations.of(context).translate("sports"));
                      // FeedController.addCurrentPage(1);
                      // bloc.add(
                      //   FetchNewsByCategoryEvent(category: "sports"),
                      // );
                    },
                  ),
                  TopicCard(
                    title: "technology",
                    icon: "technology",
                    onTap: () {
                      // provider.setAppBarTitle(
                      //     AppLocalizations.of(context).translate("technology"));
                      // FeedController.addCurrentPage(1);
                      // bloc.add(
                      //   FetchNewsByCategoryEvent(category: "technology"),
                      // );
                    },
                  ),
                  TopicCard(
                    title: "startups",
                    icon: "startups",
                    onTap: () {
                      // provider.setAppBarTitle(
                      //     AppLocalizations.of(context).translate("startups"));
                      // FeedController.addCurrentPage(1);
                      // bloc.add(
                      //   FetchNewsByTopicEvent(topic: "startups"),
                      // );
                    },
                  ),
                  TopicCard(
                    title:
                        "entertainment",
                    icon: "entertainment",
                    onTap: () {
                      // provider.setAppBarTitle(AppLocalizations.of(context)
                      //     .translate("entertainment"));
                      // FeedController.addCurrentPage(1);
                      // bloc.add(
                      //   FetchNewsByCategoryEvent(category: "entertainment"),
                      // );
                    },
                  ),
                  TopicCard(
                    title: "education",
                    icon: "education",
                    onTap: () {
                      // provider.setAppBarTitle(
                      //     AppLocalizations.of(context).translate("education"));
                      // FeedController.addCurrentPage(1);
                      // bloc.add(
                      //   FetchNewsByTopicEvent(topic: "education"),
                      // );
                    },
                  ),
                  TopicCard(
                    title: "automobile",
                    icon: "automobile",
                    onTap: () {
                      // provider.setAppBarTitle(
                      //     AppLocalizations.of(context).translate("automobile"));
                      // FeedController.addCurrentPage(1);
                      // bloc.add(
                      //   FetchNewsByTopicEvent(topic: "automobile"),
                      // );
                    },
                  ),
                  TopicCard(
                    title: "science",
                    icon: "science",
                    onTap: () {
                      // provider.setAppBarTitle(
                      //     AppLocalizations.of(context).translate("science"));
                      // FeedController.addCurrentPage(1);
                      // bloc.add(
                      //   FetchNewsByCategoryEvent(category: "science"),
                      // );
                    },
                  ),
                  TopicCard(
                    title: "travel",
                    icon: "travel",
                    onTap: () {
                      // provider.setAppBarTitle(
                      //     AppLocalizations.of(context).translate("travel"));
                      // FeedController.addCurrentPage(1);
                      // bloc.add(
                      //   FetchNewsByTopicEvent(topic: "travel"),
                      // );
                    },
                  ),
                  TopicCard(
                    title: "fashion",
                    icon: "fashion",
                    onTap: () {
                    //   provider.setAppBarTitle(
                    //       AppLocalizations.of(context).translate("fashion"));
                    //   FeedController.addCurrentPage(1);
                    //   bloc.add(
                    //     FetchNewsByTopicEvent(topic: "fashion"),
                    //   );
                    },
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
