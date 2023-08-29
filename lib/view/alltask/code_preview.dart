import 'dart:math';

// import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
// import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbeginner/global/code_highlighter.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/task_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart' as url_launcher;

class CodePreviewsPage extends StatefulWidget {
  final String title;
  final String path;
  final TaskItem? item;

  const CodePreviewsPage({super.key,required this.title, required this.path, this.item});

  @override
  State<CodePreviewsPage> createState() => _CodePreviewsPageState();
}

class _CodePreviewsPageState extends State<CodePreviewsPage>
    with SingleTickerProviderStateMixin {
    TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.whiteColor,
        title: getTxtAppColor(msg: widget.title,fontWeight: FontWeight.w600, fontSize: 16),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: ColorConst.appColor,
            onPressed: ()=> Navigator.pop(context)
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(FontAwesomeIcons.share),
            iconSize: 18,
            color: ColorConst.appColor,
            onPressed: ()=> _shareText()
          )
        ],
        bottom: _getTab()
      ),
      body:_createUi()
    );
  }

  Widget _createUi() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        widget.item!.page!,
        MyCodeView(filePath: widget.path)
      ],
    );
  }

  TabBar _getTab() {
    return TabBar(
      controller: _tabController,
      indicatorColor: ColorConst.appColor,
      indicatorWeight: 3.0,
      tabs: const <Widget>[
        Tab(
          child: ListTile(
            leading: Icon(
              Icons.phone_android,
              color: ColorConst.appColor,
            ),
            title: Text(
                'Preview',
                style: TextStyle(color: ColorConst.appColor, fontWeight: FontWeight.w600)
            ),
          ),
        ),
        Tab(
          child: ListTile(
            leading: Icon(
              Icons.code,
              color: ColorConst.appColor
            ),
            title: Text(
              'Code',
              style: TextStyle(color: ColorConst.appColor, fontWeight: FontWeight.w600)
            ),
          ),
        ),
      ],
    );
  }
  _shareText() async {
    try {
      // await Share.text(title, '${StringConst.githubRepo}$path', 'text/plain');
    } catch (e) {
      printLog(msg: 'error: $e');
    }
  }

}

class MyCodeView extends StatefulWidget {
  final String filePath;

  const MyCodeView({super.key, required this.filePath});

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
    // print('code path ${widget.filePath}');
    Future<String>  dff = rootBundle.loadString(widget.filePath) ;
    return FutureBuilder(
      future: dff,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        // print('snapshit ${snapshot.data}   :  ${snapshot.error}');
        if (snapshot.hasData) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(4.0),
              child: _getCodeView(snapshot.data!, context),
            ),
            // floatingActionButton: AnimatedFloatingActionButton(
            //   fabButtons: _buildFloatingButtons(),
            //   colorStartAnimation: Colors.indigo,
            //   colorEndAnimation: Colors.red,
            //   animatedIconData: AnimatedIcons.menu_close,
            // ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
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
      constraints: const BoxConstraints.expand(),
      child: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: RichText(
              textScaleFactor: _textScaleFactor,
              text: TextSpan(
                style: const TextStyle(fontFamily: 'monospace', fontSize: 12.0),
                children: <TextSpan>[
                  DartSyntaxHighlighter(style).format(codeContent)
                ],
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
        backgroundColor: ColorConst.appColor,
        tooltip: 'Copy code link to clipboard',
        onPressed: () async {
          await Clipboard.setData(ClipboardData(text: widget.githubPath));
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Code link copied to Clipboard!'),
          ));
        },
        child: const Icon(Icons.content_copy),
      ),
      FloatingActionButton(
        heroTag: "open",
        backgroundColor: ColorConst.appColor,
        tooltip: 'View code on github',
        onPressed: () {
          //TODO UNDO
          // url_launcher.launch(this.widget.githubPath);
        },
        child: const Icon(Icons.open_in_new),
      ),
      FloatingActionButton(
        heroTag: "zoom_out",
        backgroundColor: ColorConst.appColor,
        tooltip: 'Zoom out',
        onPressed: () =>
            setState(() {
              _textScaleFactor = max(0.8, _textScaleFactor - 0.1);
            }),
        child: const Icon(Icons.zoom_out),
      ),
      FloatingActionButton(
        heroTag: "zoom_in",
        backgroundColor: ColorConst.appColor,
        tooltip: 'Zoom in',
        onPressed: () =>
            setState(() {
              _textScaleFactor += 0.1;
            }),
        child: const Icon(Icons.zoom_in),
      ),
    ];
  }
}
