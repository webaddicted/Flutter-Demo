import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/db/sqflite_user_table.dart';
import 'package:flutterbeginner/model/sqflite_login_user.dart';
import 'package:flutterbeginner/view/sqflite/sqflite_edit_user.dart';

class SqliteHome extends StatefulWidget {
  @override
  _SqliteHomeState createState() => _SqliteHomeState();
}

class _SqliteHomeState extends State<SqliteHome> {

  BuildContext ctx;
  List<SqfliteLoginUserBean> dataResult;

  @override
  void initState() {
    super.initState();
    getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          getAppBarWithBackBtn(context, StringConst.SQFLITE_USERHOME_TITLE),
      body: Builder(
        builder: (context) => _createUi(context),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (_) => SqfliteEditUser.data(null)),)
            .then((val) => val ? _getRequests() : null)
      ),
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return new Container(
      child: new ListView.builder(
          itemCount: dataResult == null ? 0 : dataResult.length,
          itemBuilder: (BuildContext context, int index) {
            return createRow(index);
          }),
    );
  }

  Widget createRow(int index) {
    SqfliteLoginUserBean userBean = dataResult[index];
    return GestureDetector(
      onTap: () => {
        showAlertDialog(context, "${userBean.name}",
            "Email Id : ${userBean.emailId}\nDOB : ${userBean.dob}")
      },
      child: Card(
        margin: EdgeInsets.all(3),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 5, top: 5, bottom: 5),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(top: 5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text("${userBean.name}",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15)),
                  Container(child: _getPopupMenu(userBean)),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 3)),
              Text("Email Id : ${userBean.emailId}"),
              Padding(padding: EdgeInsets.only(top: 3)),
              Text("Mobile No : ${userBean.mobileNo}"),
              Padding(padding: EdgeInsets.only(top: 3)),
              Text("DOB : ${userBean.dob}"),
              Padding(padding: EdgeInsets.only(top: 3)),
            ],
          ),
        ),
      ),
    );
  }

  void getAllUsers() async {
    List<SqfliteLoginUserBean> alluser = await SqfliteUserInfo.getUserAllInfo();
    dataResult = alluser;
    setState(() {});
  }

  Widget _getPopupMenu(SqfliteLoginUserBean userBean) {
    return PopupMenuButton(
      itemBuilder: (_) => <PopupMenuItem<String>>[
        PopupMenuItem<String>(child: const Text('Edit User'), value: '0'),
        PopupMenuItem<String>(child: const Text('Delete User'), value: '1'),
      ],
      onSelected: (selected) {
        switch (selected) {
          case '0':
            {Navigator.of(context).push(new MaterialPageRoute(
                  builder: (_) => SqfliteEditUser.data(userBean)),)
                  .then((val) => val ? _getRequests() : null);
            }
        // navigationPush(context, SqfliteEditUser.data(userBean));
            break;
          case '1':
            {
              SqfliteUserInfo.deleteUser(userBean.emailId);
              getAllUsers();
              showSnackBar(ctx, "${userBean.name} successfully deleted.");
              setState(() {});
              break;
            }
        }
        print(selected);
      },
      icon: Icon(
        Icons.more_vert,
        color: Colors.blue,
      ),
    );
  }
  _getRequests()async{
    setState(() {
      getAllUsers();
    });
  }
//  void _getRequests() async{
//    setState(() {
//
//    });
//  }
}
