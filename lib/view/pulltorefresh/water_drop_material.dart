import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WaterDropMaterial extends StatefulWidget {
  @override
  _WaterDropMaterialState createState() => _WaterDropMaterialState();
}

class _WaterDropMaterialState extends State<WaterDropMaterial> {
  List<String> items = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8"
  ];
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    print(items);
    if (mounted)
      setState(() {
        items.add((items.length + 1).toString());
      });
    _refreshController.loadComplete();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data time field"),
      ),
      body: Scrollbar(
        child: SmartRefresher(

          enablePullDown: true,
          header: WaterDropMaterialHeader(),
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus status) {
              Widget body;
              if (status == LoadStatus.idle) {
                body = Text("pull up load");
              } else if (status == LoadStatus.loading) {
                body = CupertinoActivityIndicator();
              } else if (status == LoadStatus.failed) {
                body = Text("Load Failed!Click retry!");
              } else if (status == LoadStatus.canLoading) {
                body = Text("release to load more");
              } else {
                body = Text("No more Data");
              }
              return Container(
                height: 95.0,
                child: Center(child: body),
              );
            },
          ),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.builder(
            itemBuilder: (c, i) => Card(child: Center(child: Text(items[i]))),
            itemExtent: 100.0,
            itemCount: items.length,
          ),
        ),
      ),
    );
  }
}