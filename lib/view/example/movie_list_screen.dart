import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';
class MovieListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dummyImgList.length,
        shrinkWrap: true,
        physics:  const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return fullListImage(
              name: 'Item $index',
              image: dummyImgList[index],
              tag: 'Item List $index',
              onTap: () {
              });
        });
  }
  Widget fullListImage({String? name, String? image, String? tag, Function? onTap}) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Hero(
                  tag: tag!,
                  child: SizedBox(
                      height: 180,
                      width: double.infinity, child: getCacheImage(url:image!, height: 180))),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    name==null?"":name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                  child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          splashColor: Colors.redAccent, onTap: () => onTap!()))),
            ],
          )),
    );
  }
}
