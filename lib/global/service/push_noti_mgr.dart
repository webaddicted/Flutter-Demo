import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
class PushNotiMgr {
  PushNotiMgr._();
  factory PushNotiMgr() => _instance;
  static final PushNotiMgr _instance = PushNotiMgr._();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;
  Future<void> init() async {
    // For testing purposes print the Firebase Messaging token
    String token = await _firebaseMessaging.getToken();
    print("FirebaseMessaging token: $token");

    if (!_initialized) {
      // For iOS request permission first.
      if(Platform.isAndroid) {
        _firebaseMessaging.requestNotificationPermissions();

        //      _firebaseMessaging.configure();
        _firebaseMessaging.configure(
          onMessage: (Map<String, dynamic> message) async {
            myBackgroundMessageHandler(message);
            print("onMessage: $message");
          },
          onLaunch: (Map<String, dynamic> message) async {
            myBackgroundMessageHandler(message);
            print("onLaunch: $message");
          },
          onResume: (Map<String, dynamic> message) async {
            myBackgroundMessageHandler(message);
            print("onResume: $message");
          },
        );
      }else {
      _firebaseMessaging.requestNotificationPermissions(
          const IosNotificationSettings(
              sound: true, badge: true, alert: true, provisional: true));
      _firebaseMessaging.onIosSettingsRegistered
          .listen((IosNotificationSettings settings) {
        print("Settings registered: $settings");
      });
      _firebaseMessaging.getToken().then((String token) {
        assert(token != null);
        print("Push Messaging token: $token");
      });
      _firebaseMessaging.subscribeToTopic("matchscore");
    }
      _initialized = true;
    }
  }

  Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  final String serverToken = StringConst.SERVER_KEY;
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  Future<Map<String, dynamic>> sendAndRetrieveMessage() async {
    await firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true, provisional: false),
    );

    await http.post(
      'https://fcm.googleapis.com/fcm/send',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': 'this is a body',
            'title': 'this is a title'
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
          'to': await firebaseMessaging.getToken(),
        },
      ),
    );

    final Completer<Map<String, dynamic>> completer =
    Completer<Map<String, dynamic>>();

    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        completer.complete(message);
      },
    );

    return completer.future;
  }
}
