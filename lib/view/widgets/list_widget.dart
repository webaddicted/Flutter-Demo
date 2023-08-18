import 'package:flutter/material.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';

class ListWidget extends StatelessWidget {
  final String thirdTitle;
  final bool imageRight;
  final double elevation;
  final Function onTap;

  const ListWidget(
      {Key? key,
      required this.thirdTitle,
      this.imageRight = false,
      this.elevation = 0.5,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String title = "Vodafone Zoo Zoo";
    return Card(
      elevation: elevation,
      child: InkWell(
        borderRadius: BorderRadius.circular(4.0),
        onTap: () {
          onTap(dummyLargeImg[0]);
        },
        child: Row(
          children: <Widget>[
            _buildThumbnail(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                            softWrap: true,
                          ),
                        ),
                        _buildTag(context)
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Text.rich(
                      const TextSpan(
                        children: [
                          TextSpan(
                            text: "Year 2020",
                          ),
                        ],
                      ),
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 5.0),
                    const Row(
                      children: <Widget>[
                        Text("Rate"),
                        SizedBox(width: 10.0),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildThumbnail() {
    return Container(
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: imageRight
            ? const BorderRadius.only(
                topRight: Radius.circular(4.0),
                bottomRight: Radius.circular(4.0),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                bottomLeft: Radius.circular(4.0),
              ),
        image: DecorationImage(
          image: NetworkImage(dummyImgList[0]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container _buildTag(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 8.0,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Theme.of(context).primaryColor),
      child: const Text(
        "Rs. 1,80,000",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
