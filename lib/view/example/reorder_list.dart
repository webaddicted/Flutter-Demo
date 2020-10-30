import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/customview/refresh_recordable_listview.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReorderPage extends StatefulWidget {
  @override
  _ReorderPageState createState() => _ReorderPageState();
}

class _ReorderPageState extends State<ReorderPage> {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  // PersistentBottomSheetController<void> _bottomSheet;
  RefreshController _refreshController = RefreshController();
  ReorderableListType _itemType = ReorderableListType.threeLine;
  bool _reverse = false;
  bool _reverseSort = false;
  final List<_ListItem> _items = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
  ].map<_ListItem>((String item) => _ListItem(item, false)).toList();

  Future bottomSheet;

  void changeItemType(ReorderableListType type) {
    if (mounted)
      setState(() {
        _itemType = type;
      });
    Navigator.pop(context);
  }

  Widget buildListTile(_ListItem item) {
    Widget listTile;
    switch (_itemType) {
      case ReorderableListType.threeLine:
        listTile = CheckboxListTile(
          key: Key(item.value),
          isThreeLine: true,
          value: item.checkState ?? false,
          onChanged: (bool newValue) {
            if (mounted)
              setState(() {
                item.checkState = newValue;
              });
          },
          title: getTxtBlackColor(msg:'This item represents ${item.value}.', fontWeight: FontWeight.bold, fontSize: 16),
          subtitle: getTxt(msg: StringConst.DUMMY_TEXT),
          secondary: const Icon(Icons.drag_handle),
        );
        break;
      case ReorderableListType.horizontalAvatar:
      case ReorderableListType.verticalAvatar:
        listTile = Container(
          padding: EdgeInsets.all(3),
          key: Key(item.value),
          height: 100.0,
          width: 100.0,
          child: CircleAvatar(
            child: getTxtWhiteColor(msg:item.value, fontSize: 25, fontWeight: FontWeight.bold),
            backgroundColor: Colors.green,
          ),
        );
        break;
    }

    return listTile;
  }

  void _onReorder(int oldIndex, int newIndex) {
    if (mounted)
      setState(() {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final _ListItem item = _items.removeAt(oldIndex);
        _items.insert(newIndex, item);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Reorderable list'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.sort_by_alpha),
            tooltip: 'Sort',
            onPressed: () {
              if (mounted)
                setState(() {
                  _reverseSort = !_reverseSort;
                  _items.sort((_ListItem a, _ListItem b) => _reverseSort
                      ? b.value.compareTo(a.value)
                      : a.value.compareTo(b.value));
                });
            },
          ),
          IconButton(
            icon: Icon(
              Theme.of(context).platform == TargetPlatform.iOS
                  ? Icons.more_horiz
                  : Icons.more_vert,
            ),
            tooltip: 'Show menu',
            onPressed: () => showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return _bottomSheetContainer();
                }),
          ),
        ],
      ),
      body: Scrollbar(
        child: RefreshReorderableListView(
          header: _itemType != ReorderableListType.threeLine
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: getTxtAppColor(
                      msg: 'Header of the list',
                      fontSize: 25,
                      fontWeight: FontWeight.bold))
              : null,
          onReorder: _onReorder,
          reverse: _reverse,
          scrollDirection: _itemType == ReorderableListType.horizontalAvatar
              ? Axis.horizontal
              : Axis.vertical,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: _items.map<Widget>(buildListTile).toList(),
          refreshController: _refreshController,
        ),
      ),
    );
  }

  Widget _bottomSheetContainer() {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black26)),
      ),
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          CheckboxListTile(
            dense: true,
            title: const Text('Reverse'),
            value: _reverse,
            onChanged: (value) {},
          ),
          RadioListTile<ReorderableListType>(
            dense: true,
            title: const Text('Horizontal Avatars'),
            value: ReorderableListType.horizontalAvatar,
            groupValue: _itemType,
            onChanged: changeItemType,
          ),
          RadioListTile<ReorderableListType>(
            dense: true,
            title: const Text('Vertical Avatars'),
            value: ReorderableListType.verticalAvatar,
            groupValue: _itemType,
            onChanged: changeItemType,
          ),
          RadioListTile<ReorderableListType>(
            dense: true,
            title: const Text('Three-line'),
            value: ReorderableListType.threeLine,
            groupValue: _itemType,
            onChanged: changeItemType,
          ),
        ],
      ),
    );
  }
}

class _ListItem {
  _ListItem(this.value, this.checkState);

  final String value;

  bool checkState;
}
