import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/dialog_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:local_auth/local_auth.dart';

class FingerPrintScreen extends StatefulWidget {
  @override
  _FingerPrintScreenState createState() => _FingerPrintScreenState();
}

class _FingerPrintScreenState extends State<FingerPrintScreen> {
  BuildContext _ctx;
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    launchDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.FINGERS_PRINT_TITLE),
      body: Builder(builder: (_context) {
        return _createUi(_context);
      }),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Column(children: <Widget>[
          getTxt(msg: 'Can check biometrics: $_canCheckBiometrics\n'),
          raisedBtn('Check biometrics', _checkBiometrics),
          Text('Available biometrics: $_availableBiometrics\n'),
          raisedBtn('Get available biometrics', _getAvailableBiometrics),
          Text('Current State: $_authorized\n'),
          raisedBtn('Authenticate', _authenticate),
        ]));
  }

  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException catch (e) {
      showSingleClickDialog(
          ctx: _ctx, title: e.code, msg: e.message + "", okClick: dialogClick);
      print(e);
    }
    if (!mounted) return;

    if (authenticated) showSnackBar(_ctx, 'Authorized');
    setState(() {
      _authorized = authenticated ? 'Authorized' : 'Not Authorized';
    });
  }

  dialogClick() {
    Navigator.pop(_ctx);
    Navigator.pop(_ctx);
  }

  launchDialog() async {
    if (await auth.canCheckBiometrics) {
      _authenticate();
    }
  }
}
