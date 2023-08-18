import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/dialog_utility.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/sqflite_login_user.dart';
import 'package:flutterbeginner/view/login/login_page1.dart';

class SqliteHome extends StatefulWidget {
  @override
  State<SqliteHome> createState() => _SqliteHomeState();
}

class _SqliteHomeState extends State<SqliteHome> {

  late BuildContext ctx;
   List<SqfliteLoginUserBean>? dataResult;

  @override
  void initState() {
    super.initState();
    getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          getAppBarWithBackBtn(ctx:context, title:StringConst.SQFLITE_USERHOME_TITLE),
      body: Builder(
        builder: (context) => _createUi(context),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => LoginPage1()),)
            .then((val) => val ? _getRequests() : null)
      ),
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return ListView.builder(
        itemCount: dataResult == null ? 0 : dataResult?.length,
        itemBuilder: (BuildContext context, int index) {
          return createRow(index);
        });
  }

  Widget createRow(int index) {
    SqfliteLoginUserBean userBean = dataResult![index];
    return GestureDetector(
      onTap: () => {
        showAlertDialog(ctx:context, title:userBean.name!,
            msg:"Email Id : ${userBean.emailId}\nDOB : ${userBean.dob}")
      },
      child: Card(
        margin: const EdgeInsets.all(3),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 5, top: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(userBean.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15)),
                  Container(child: _getPopupMenu(userBean)),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 3)),
              Text("Email Id : ${userBean.emailId}"),
              const Padding(padding: EdgeInsets.only(top: 3)),
              Text("Mobile No : ${userBean.mobileNo}"),
              const Padding(padding: EdgeInsets.only(top: 3)),
              Text("DOB : ${userBean.dob}"),
              const Padding(padding: EdgeInsets.only(top: 3)),
            ],
          ),
        ),
      ),
    );
  }

  void getAllUsers() async {
    // List<SqfliteLoginUserBean> alluser = await SqfliteUserInfo.getUserAllInfo();
    dataResult = null;
    setState(() {});
  }

  Widget _getPopupMenu(SqfliteLoginUserBean userBean) {
    return PopupMenuButton(
      itemBuilder: (_) => <PopupMenuItem<String>>[
        const PopupMenuItem<String>(value: '0', child: Text('Edit User')),
        const PopupMenuItem<String>(value: '1', child: Text('Delete User')),
      ],
      onSelected: (selected) {
        switch (selected) {
          case '0':
            {
            }
        // navigationPush(context, SqfliteEditUser.data(userBean));
            break;
          case '1':
            {
              // SqfliteUserInfo.deleteUser(userBean.emailId);
              // getAllUsers();
              // showSnackBar(ctx, "${userBean.name} successfully deleted.");
              // setState(() {});
              break;
            }
        }
        printLog(msg: selected.toString());
      },
      icon: const Icon(
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
