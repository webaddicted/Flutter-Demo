import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_twitter/flutter_twitter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialLoginHelper {
  static FirebaseAuth _fcmAuth;

  static void signInType(SocialLoginType type, loginResult) async {
    _fcmAuth = FirebaseAuth.instance;
    switch (type) {
      case SocialLoginType.GOOGLE:
        return _googleSign(loginResult);
      case SocialLoginType.FACEBOOK:
        return _facebookSignIn(loginResult);
      case SocialLoginType.TWITTER:
        return _twitterLogin(loginResult);
        break;
    }
  }

  static void _googleSign(loginResult) async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount googleSignInAccount = await googleSignIn
          .signIn();
      if (googleSignInAccount == null) return loginResult(null, true, null);
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      _fcmSignIn(credential, loginResult);
    }catch(e){
      print(e.toString());
      loginResult(null, false, e.toString());
    }
  }

  static void _facebookSignIn(loginResult) async {
    final FacebookLogin facebookSignIn = new FacebookLogin();
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        AuthCredential _authCredential = FacebookAuthProvider.getCredential(
            accessToken: result.accessToken.token);
        _fcmSignIn(_authCredential, loginResult);
        break;
      case FacebookLoginStatus.cancelledByUser:
        return loginResult(null, true, null);
      case FacebookLoginStatus.error:
        return loginResult(null, false, result.errorMessage);
    }
  }

  static void _twitterLogin(loginResult) async {
    var twitterLogin = new TwitterLogin(
      consumerKey: 'euRoJOFhjuSz0PgiDfm87U5y3',
      consumerSecret: 'ZLMmiM3RL9ftD9uenN3tDFu742P1cwJONzllNjC8KpdvNjZuvJ',
    );
    final TwitterLoginResult result = await twitterLogin.authorize();
    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        var session = result.session;
        AuthCredential _authCredential = TwitterAuthProvider.getCredential(
            authToken: session?.token ?? '',
            authTokenSecret: session?.secret ?? '');
        _fcmSignIn(_authCredential, loginResult);
        break;
      case TwitterLoginStatus.cancelledByUser:
        return loginResult(null, true, null);
      case TwitterLoginStatus.error:
        return loginResult(null, false, result.errorMessage);
    }
  }

  static void _fcmSignIn(AuthCredential authCredential, loginResult) async {
     var _currentUser = await _fcmAuth.signInWithCredential(authCredential);
    loginResult(_currentUser.user, false, null);
  }

  void signOut() async {
    await _fcmAuth.signOut();
    print("User Successfully Sign Out");
  }
}

enum SocialLoginType { GOOGLE, FACEBOOK, TWITTER }
