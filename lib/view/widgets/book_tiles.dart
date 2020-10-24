import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/view/widgets/widgets.dart';

class BooksTile extends StatelessWidget {
  final String imgAssetPath, title, description, categorie;
  final int rating;

  BooksTile(
      {@required this.rating,
      @required this.description,
      @required this.title,
      @required this.categorie,
      @required this.imgAssetPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 200,
        margin: EdgeInsets.only(right: 16),
        alignment: Alignment.bottomLeft,
        child: Stack(
          children: <Widget>[
            Container(
              height: 180,
              alignment: Alignment.bottomLeft,
              child: Card(
                child: Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 140,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 110,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 220,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                title,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(categorie,
                                  style: TextStyle(color: Color(0xff007084))),
                              SizedBox(height: 3),
                              Text(
                                description,
                                maxLines: 4,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              Spacer(),
                              StarRating(rating: rating)
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Container(
              height: 180,
              margin: EdgeInsets.only(
                left: 12,
                top: 6,
              ),
              child: Image.network(
                imgAssetPath,
                height: 150,
                width: 100,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
