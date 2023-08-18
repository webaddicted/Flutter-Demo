import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactScreen extends StatefulWidget {
  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late BuildContext _ctx;
  List<CustomContact> _allContacts = [];

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(ctx:context,title: StringConst.CONTACT_TITLE),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _checkPermission();
          },
          child: const Icon(Icons.refresh, color: Colors.white),
        ),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    if (_allContacts == null || _allContacts.isEmpty) {
      return showPbIndicator();
    }
    return Container(
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: _allContacts.length,
          itemBuilder: (BuildContext context, int index) {
            return _contactRow(_allContacts[index]);
          },
        ));
  }

  Widget _contactRow(CustomContact customContact) {
    var deviceContact = customContact.contact;
    printLog(msg: 'Contacts   :  ${deviceContact.toMap()}');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          loadCircleImgName(
              null, getInitials(deviceContact.displayName!), 0, 35),
          const Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                getTxt(msg:deviceContact.displayName!, fontWeight:FontWeight.bold),
                const SizedBox(height: 10),
                getTxt(
                    msg:(deviceContact.phones!.isNotEmpty)? deviceContact.phones!.toList()[0].value! : ''),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _checkPermission() {
    List<Permission>permission = [Permission.contacts];
    checkPermission(permission: permission, permissionResponse: (List<Permission>permissionDenied){
      if(permissionDenied==null || permissionDenied.isEmpty){
        getContact(true);
      }else{
        printLog(msg: "${permissionDenied[0]} permission is Denied. ${permissionDenied.length}");
      }
    });
  }

  void getContact(bool isPermissionGranted) async {
    if (!isPermissionGranted) return;
    if (_allContacts != null) _allContacts.clear();
    setState(() {});
    var contacts = await ContactsService.getContacts();
    _populateContacts(contacts);
  }

  void _populateContacts(Iterable<Contact> contacts) {
    var item = contacts.where((item) => item.displayName != null).toList();
    item.sort((a, b) => a.displayName!.compareTo(b.displayName!));
    _allContacts =
        item.map((contact) => CustomContact(contact: contact)).toList();
    showSnackBar(_ctx, 'Contacts count are  : ${_allContacts.length}');
    printLog(msg: 'Images   :  ${_allContacts.toList()}');
    setState(() {});
  }

  String getInitials(String bankAccountName) {
    try {
      List<String> names = bankAccountName.split(" ");
      String initials = "";
      int numWords = 2;
      for (var i = 0; i < numWords; i++) {
        initials += names[i][0];
      }
      return initials;
    } catch (e) {
      return bankAccountName.toUpperCase()[0];
    }
  }
}

class CustomContact {
  final Contact contact;
  bool isChecked;

  CustomContact({
    required this.contact,
    this.isChecked = false,
  });
}
