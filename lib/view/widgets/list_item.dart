import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/widgets/widgets.dart';

class ListItem extends StatelessWidget {
  final String imgAssetPath, title, description, categorie;

  ListItem({
      @required this.description,
      @required this.title,
      @required this.categorie,
      @required this.imgAssetPath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 80,
                height: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: Offset(1.09, 5.0),
                        blurRadius: 4.0),
                  ],
                ),
                child: Image.network(
                 imgAssetPath,
                ),
              ),
              Flexible(
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      getTxtAppColor(msg: title, fontSize: 17, fontWeight: FontWeight.bold),
                      getTxtAppColor(msg:categorie, fontSize: 17),
                      SizedBox(height: 3),
                      getTxtAppColor(msg:'5/06/202', fontSize: 17),
                      SizedBox(height: 3),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
