import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class CollapsePage3 extends StatefulWidget {
  @override
  _CollapsePage3State createState() => _CollapsePage3State();
}

class _CollapsePage3State extends State<CollapsePage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: getAppBarWithBackBtn(
        //     ctx: context, title: StringConst.LIST_DESIGN_TITLE),
        body: SingleChildScrollView(
      child: Column(
        children: [
          movieDetailHeader(),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: storyLine(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 50.0,
            ),
            child: productionCompaniesScroller(),
          ),
        ],
      ),
    ));
  }

  Widget movieDetailHeader() {
    var textTheme = Theme.of(context).textTheme;
    var movieInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'Avatar',
            style: textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: RatingBar.builder(
            initialRating: 3,
            itemSize: 20,
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.deepOrange,
            ),
            allowHalfRating: true,
            onRatingUpdate: (rating) {
              printLog(msg: "$rating");
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            direction: Axis.horizontal,
            children: _buildCategoryChips(textTheme),
          ),
        )
      ],
    );
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 260.0),
          child: ArcBannerImage(ApiConstant.DEMO_IMG),
        ),
        Positioned(
          bottom: 32.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 70.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(4.0),
                    elevation: 2.0,
                    child: Image.network(
                      ApiConstant.WEBADDICTED_IMG,
                      fit: BoxFit.cover,
                      width: 190 * 0.7,
                      height: 190,
                    ),
                  )
                  // new Poster(
                  //   "https://image.tmdb.org/t/p/w500/" + movies.posterPath,
                  //   height: 190.0,
                  // ),
                  ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: movieInformation,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildCategoryChips(TextTheme textTheme) {
    List<String> movies = [];
    movies.add('Action');
    movies.add('Comedy');
    movies.add('Fantasy');
    movies.add('Animation');
    movies.add('Sci-Fi');
    return movies.map((genres) {
      return Chip(
        label: Text(genres),
        labelStyle: textTheme.labelMedium,
        backgroundColor: Colors.black12,
      );
    }).toList();
  }

  Widget storyLine() {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16.0),
          child: getTxtAppColor(
              msg: 'Synopsis', fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
          child: Text(
            StringConst.DUMMY_TEXT + StringConst.DUMMY_TEXT,
            style:
                textTheme.labelMedium?.copyWith(color: Colors.black45, fontSize: 16.0),
          ),
        ),
        // No expand-collapse in this tutorial, we just slap the "more"
        // button below the text like in the mockup.
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'more',
                style: textTheme.displayMedium
                    ?.copyWith(fontSize: 16.0, color: theme.splashColor),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 18.0,
                color: theme.splashColor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget productionCompaniesScroller() {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Production Companies',
            style: textTheme.headlineMedium?.copyWith(fontSize: 18.0),
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(120.0),
          child: ListView.builder(
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 12.0, left: 20.0),
            itemBuilder: (cont, index) {
              return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Column(children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(ApiConstant.DEMO_IMG),
                      radius: 35.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Deepak Sharma'),
                    )
                  ]));
            },
          ),
        ),
      ],
    );
  }
}

class ArcBannerImage extends StatelessWidget {
  ArcBannerImage(this.imageUrl);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return ClipPath(
      clipper: ArcClipper(),
      child: Image.network(
        imageUrl,
        width: screenWidth,
        height: 320.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
