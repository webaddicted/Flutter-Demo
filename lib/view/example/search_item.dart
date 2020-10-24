import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchItem extends StatefulWidget {
  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  BuildContext ctx;
  List<UserDetails> _searchResult = [];
  List<UserDetails> _userDetails = [];
  TextEditingController controller = new TextEditingController();
  Icon actionIcon = new Icon(Icons.search);
  Widget appBarTitle =
      getTxtWhiteColor(msg:StringConst.SEARCH_TITLE, fontSize:16, fontWeight:FontWeight.bold);

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  Future<Null> getUserDetails() async {
    final response = await http.get(url);
    final responseJson = json.decode(response.body);

    setState(() {
      for (Map user in responseJson) {
        _userDetails.add(UserDetails.fromJson(user));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
          new IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = new Icon(Icons.close);
                  this.appBarTitle = new TextField(
                    controller: controller,
                    onChanged: onSearchTextChanged,
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.white),
                        hintText: "Search...",
                        hintStyle: new TextStyle(color: Colors.white)),
                  );
                } else {
                  controller.clear();
                  onSearchTextChanged('');
                  this.actionIcon = new Icon(Icons.search);
                  this.appBarTitle = getTxtWhiteColor(msg:StringConst.SEARCH_TITLE, fontSize:16, fontWeight:FontWeight.bold);;
                }
              });
            },
          ),
        ]),
//        appBar: getAppBarWithBackBtn(context, StringConst.SEARCH_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));

  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return _buildBody();
  }

  Widget _buildBody() {
    return new Column(
      children: <Widget>[
        new Expanded(
            child: _searchResult.length != 0 || controller.text.isNotEmpty
                ? _buildSearchResults(_searchResult)
                : _buildSearchResults(_userDetails)),
//                : _buildUsersList()),
      ],
    );
  }

  Widget _buildSearchResults(List<UserDetails> result) {
    return new ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, i) {
        return new Card(
          child: new ListTile(
            leading: new CircleAvatar(
              backgroundImage: new NetworkImage(
                result[i].profileUrl,
              ),
            ),
            title: new Text(result[i].firstName + ' ' + result[i].lastName),
          ),
          margin: const EdgeInsets.all(0.0),
        );
      },
    );
  }


  onSearchTextChanged(String text) async {
    _searchResult.clear();
    print('Search text - '+ text);
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails.forEach((userDetail) {
      if (userDetail.firstName.toLowerCase().contains(text.toLowerCase()) ||
          userDetail.lastName.contains(text)) _searchResult.add(userDetail);
    });

    setState(() {});
  }
}

final String url = 'https://jsonplaceholder.typicode.com/users';

class UserDetails {
  final int id;
  final String firstName, lastName, profileUrl;

  UserDetails(
      {this.id,
      this.firstName,
      this.lastName,
      this.profileUrl =
          'https://i.amz.mshcdn.com/3NbrfEiECotKyhcUhgPJHbrL7zM=/950x534/filters:quality(90)/2014%2F06%2F02%2Fc0%2Fzuckheadsho.a33d0.jpg'});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return new UserDetails(
      id: json['id'],
      firstName: json['name'],
      lastName: json['username'],
    );
  }
}
