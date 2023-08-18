import 'package:flutter/material.dart';

class RefreshPage extends StatefulWidget {
  @override
  State<RefreshPage> createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  final int pageSize = 30;
  bool disposed = false;
  List<String> dataList = [];
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey();

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    dataList.clear();
    for (int i = 0; i < pageSize; i++) {
      dataList.add("refresh");
    }
    if (disposed) {
      return;
    }
    setState(() {});
  }

  Future<void> loadMore() async {
    await Future.delayed(const Duration(seconds: 2));
    for (int i = 0; i < pageSize; i++) {
      dataList.add("loadmore");
    }
    if (disposed) {
      return;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        loadMore();
      }
    });
    Future.delayed(const Duration(seconds: 0), () {
      refreshKey.currentState?.show();
    });
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RefreshDemoPage"),
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: onRefresh,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == dataList.length) {
              return Container(
                margin: const EdgeInsets.all(10),
                child: const Align(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return Card(
              child: Container(
                height: 60,
                alignment: Alignment.centerLeft,
                child: Text("Item ${dataList[index]} $index"),
              ),
            );
          },
          itemCount: (dataList.length >= pageSize)
              ? dataList.length + 1
              : dataList.length,
          controller: _scrollController,
        ),
      ),
    );
  }
}
