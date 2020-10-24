import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/model/bean/UnSplashBean.dart';

/// ImageTile displayed in StaggeredGridView.
class ImageTile extends StatelessWidget {
  final Results image;

  const ImageTile(this.image);

  /// Adds rounded corners to a given [widget].
  Widget _addRoundedCorners(Widget widget) =>
      // wrap in ClipRRect to achieve rounded corners
      ClipRRect(borderRadius: BorderRadius.circular(4.0), child: widget);

  /// Returns a placeholder to show until an image is loaded.
  Widget _buildImagePlaceholder({Results image}) => Container(
        color: image != null
            ? Color(int.parse(image.color.substring(1, 7), radix: 16) +
                0x64000000)
            : Colors.grey[200],
      );

  /// Returns a error placeholder to show until an image is loaded.
  Widget _buildImageErrorWidget() => Container(
        color: Colors.grey[200],
        child: Center(
            child: Icon(
          Icons.broken_image,
          color: Colors.grey[400],
        )),
      );

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          // item onclick
          // Navigator.of(context).push(
          //   MaterialPageRoute<Null>(
          //     builder: (BuildContext context) =>
          //         // open [ImagePage] with the given image
          //         ImagePage(image.id, image.urls.regular),
          //   ),
          // );
        },
        // Hero Widget for Hero animation with [ImagePage]
        child: image != null
            ? Hero(
                tag: '${image.id}',
                child: _addRoundedCorners(CachedNetworkImage(
                  imageUrl: image?.urls.regular,
                  placeholder: (context, url) =>
                      _buildImagePlaceholder(image: image),
                  errorWidget: (context, url, obj) => _buildImageErrorWidget(),
                  fit: BoxFit.cover,
                )))
            : _buildImagePlaceholder(),
      );
}
