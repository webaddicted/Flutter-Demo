import 'dart:math';

import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbeginner/global/code_highlighter.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/model/bean/task_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class CodePreviewsPage extends StatefulWidget {
  final String title;
  final String path;
  final TaskItem item;

  CodePreviewsPage(
      {Key key, @required this.title, @required this.path, this.item});

  @override
  _CodePreviewsPageState createState() =>
      _CodePreviewsPageState(title, path, item);
}

class _CodePreviewsPageState extends State<CodePreviewsPage>
    with SingleTickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
// class CodePreviewsPage1 extends StatelessWidget
  final String title;
  final String path;
  final TaskItem item;
  TabController _tabController;

  _CodePreviewsPageState(this.title, this.path, this.item);

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.shareSquare),
            tooltip: "Open full preview",
            onPressed: () {
              _shareText();
              // Share.text(title, '${StringConst.githubRepo}$path', 'file');
            },
          )
        ],
        bottom: _getTab()
      ),
      body:_createUi()
      // TabBarView(
      //   children: <Widget>[
      //     MyCodeView(filePath: path),
      //     // page
      //     // AlwaysAliveWidget(child: page),
      //   ],
      // ),
      // body: MyCodeView(
      //   filePath: path,
      // )
    );
  }

  Widget _createUi() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        MyCodeView(filePath: path),
        // new FirstPage("First Screen"),
        item.page
        // new FirstPage("Second Screen"),
      ],
    );
  }

  TabBar _getTab() {
    return TabBar(
      controller: _tabController,
      indicatorColor: Colors.white,
      indicatorWeight: 3.0,
      tabs: <Widget>[
        Tab(
          child: ListTile(
            leading: Icon(
              Icons.code,
              color: Colors.white,
            ),
            title: Text(
              'Code',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Tab(
          child: ListTile(
            leading: Icon(
              Icons.phone_android,
              color: Colors.white,
            ),
            title: Text(
              'Preview',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
  _shareText() async {
    try {
      await Share.text(title, '${StringConst.githubRepo}$path', 'text/plain');
    } catch (e) {
      print('error: $e');
    }
  }

}

class MyCodeView extends StatefulWidget {
  final String filePath;

  MyCodeView({@required this.filePath});

  String get githubPath => '${StringConst.githubRepo}$filePath';

  @override
  MyCodeViewState createState() {
    return MyCodeViewState();
  }
}

class MyCodeViewState extends State<MyCodeView> {
  double _textScaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    print('code path ${widget.filePath}');
    return FutureBuilder(
      future: rootBundle.loadString(widget.filePath) ??
          'Error loading source code from $this.filePath',
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        print('snapshit ${snapshot.data}   :  ${snapshot.error}');
        if (snapshot.hasData) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.all(4.0),
              child: _getCodeView(snapshot.data, context),
            ),
            floatingActionButton: AnimatedFloatingActionButton(
              fabButtons: _buildFloatingButtons(),
              colorStartAnimation: Colors.indigo,
              colorEndAnimation: Colors.red,
              animatedIconData: AnimatedIcons.menu_close,
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _getCodeView(String codeContent, BuildContext context) {
    final SyntaxHighlighterStyle style =
    Theme
        .of(context)
        .brightness == Brightness.dark
        ? SyntaxHighlighterStyle.darkThemeStyle()
        : SyntaxHighlighterStyle.lightThemeStyle();
    return Container(
      constraints: BoxConstraints.expand(),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: RichText(
              textScaleFactor: this._textScaleFactor,
              text: TextSpan(
                style: TextStyle(fontFamily: 'monospace', fontSize: 12.0),
                children: <TextSpan>[
                  DartSyntaxHighlighter(style).format(codeContent)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFloatingButtons() {
    return <Widget>[
      FloatingActionButton(
        heroTag: "copy",
        child: Icon(Icons.content_copy),
        tooltip: 'Copy code link to clipboard',
        onPressed: () async {
          await Clipboard.setData(ClipboardData(text: widget.githubPath));
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Code link copied to Clipboard!'),
          ));
        },
      ),
      FloatingActionButton(
        heroTag: "open",
        child: Icon(Icons.open_in_new),
        tooltip: 'View code on github',
        onPressed: () {
          url_launcher.launch(this.widget.githubPath);
        },
      ),
      FloatingActionButton(
        heroTag: "zoom_out",
        child: Icon(Icons.zoom_out),
        tooltip: 'Zoom out',
        onPressed: () =>
            setState(() {
              this._textScaleFactor = max(0.8, this._textScaleFactor - 0.1);
            }),
      ),
      FloatingActionButton(
        heroTag: "zoom_in",
        child: Icon(Icons.zoom_in),
        tooltip: 'Zoom in',
        onPressed: () =>
            setState(() {
              this._textScaleFactor += 0.1;
            }),
      ),
    ];
  }
}
