import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  BuildContext _ctx;
  var _allContacts = List<CustomContact>();

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(context, StringConst.CONTACT_TITLE),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _checkPermission();
          },
          child: Icon(Icons.refresh, color: Colors.white),
        ),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    if (_allContacts == null || _allContacts.length == 0)
      return showPbIndicator(true);
    return new Container(
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
    print('Contacts   :  ' + deviceContact.toMap().toString());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        child: Row(
          children: <Widget>[
            loadCircleImgName(null, deviceContact.displayName, 0, 35),
            Padding(padding: EdgeInsets.only(left: 10)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  getTxt(deviceContact.displayName, FontWeight.bold),
                  SizedBox(height: 10),
                  getTxt(
                      deviceContact.phones.length > 0
                          ? deviceContact.phones.toList()[0].value
                          : '',
                      FontWeight.normal),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _checkPermission() {
    var _storagePermission = PermissionGroup.contacts;
    var permissionArray = [_storagePermission];
    checkPermission(_ctx, permissionArray, getContact);
  }

  void getContact(bool isPermissionGrented) async {
    if (!isPermissionGrented) return;
    if (_allContacts != null) _allContacts.clear();
    setState(() {});
    var contacts = await ContactsService.getContacts();
    _populateContacts(contacts);
  }

  void _populateContacts(Iterable<Contact> contacts) {
    var _contacts = contacts.where((item) => item.displayName != null).toList();
    _contacts.sort((a, b) => a.displayName.compareTo(b.displayName));
    _allContacts =
        _contacts.map((contact) => CustomContact(contact: contact)).toList();
    showSnackBar(_ctx, 'Contacts count are  : ${_allContacts.length}');
    debugPrint('Images   :  ' + _allContacts.toList().toString());
    setState(() {});
  }


}

class CustomContact {
  final Contact contact;
  bool isChecked;

  CustomContact({
    this.contact,
    this.isChecked = false,
  });
}
