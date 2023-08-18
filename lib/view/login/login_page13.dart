import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class LoginPage13 extends StatefulWidget {
  @override
  _LoginPage13State createState() => _LoginPage13State();
}

class _LoginPage13State extends State<LoginPage13> {
  final Color primary = Color(0xff4BBEC0);
  final TextStyle style = TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Ink(
            decoration: BoxDecoration(
              color: primary,
            ),
          ),
          Positioned(
            top: -100.0,
            left: 100.0,
            child: Transform.rotate(
              angle: -0.5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white.withOpacity(0.3),
                ),
                width: 150,
                height: 300,

              ),
            ),
          ),
          Positioned(
            bottom: -120.0,
            right: 90.0,
            child: Transform.rotate(
              angle: -0.8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white.withOpacity(0.3),
                ),
                width: 150,
                height: 300,

              ),
            ),
          ),
          Positioned(
            top: -50.0,
            left: 30.0,
            child: Transform.rotate(
              angle: -0.5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white.withOpacity(0.3),
                ),
                width: 150,
                height: 200,

              ),
            ),
          ),
          Positioned(
            bottom: -80.0,
            right: 0.0,
            child: Transform.rotate(
              angle: -0.8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white.withOpacity(0.3),
                ),
                width: 150,
                height: 200,

              ),
            ),
          ),
          loginPage()
        ],
      ),
    );
  }

  Widget loginPage() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
          top: 10, left: 16.0, right: 16.0, bottom: 10.0),
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 70),
            padding:
            const EdgeInsets.only(top: 80.0, left: 16.0, right: 16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                color: Colors.white.withOpacity(0.6)),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.perm_contact_calendar),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: TextField(
                          decoration:
                          InputDecoration(hintText: "Mobile or Email"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      Icon(Icons.lock),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password",
                              suffixIcon: GestureDetector(
                                child: Icon(Icons.remove_red_eye),
                                onTap: () {},
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      width:double.infinity,
                      child: MaterialButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text("Login".toUpperCase()),
                        onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
                      )
                  ),
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    child: Text(
                      "Forgot Password".toUpperCase(),
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'recover');
                    },
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Divider(
                            color: Colors.grey.shade600,
                          )),
                      const SizedBox(width: 10.0),
                      getTxtBlackColor(
                        msg:"Not a member?",
                      fontSize: 15
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                          child: Divider(
                            color: Colors.grey.shade600,
                          )),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    child: Text(
                      "Create Account".toUpperCase(),
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'register');
                    },
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 20.0),
              alignment: Alignment.center,
              height: 100,
              child: loadCircleImg(ApiConstant.DEMO_IMG, 0, 100)),
        ],
      ),
    );
  }
}
