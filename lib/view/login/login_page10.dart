import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';

class LoginPage10 extends StatefulWidget {
  @override
  _LoginPage10State createState() => _LoginPage10State();
}

class _LoginPage10State extends State<LoginPage10> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 100.0),
            Stack(
              children: <Widget>[
                Positioned(
                  left: 20.0,
                  top: 15.0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    width: 70.0,
                    height: 20.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Text(
                    "Sign In",
                    style:
                    TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Email"),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password"),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(right: 16.0),
                alignment: Alignment.centerRight,
                child: Text("Forgot your password?")),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: "By clicking Sign Up you agree to the following "),
                  TextSpan(
                      text: "Terms and Conditions",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.indigo)),
                  TextSpan(text: " withour reservations."),
                ]),
              ),
            ),
            const SizedBox(height: 80.0),
            Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(40.0, 16.0, 30.0, 16.0),
                color: Colors.purpleAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0))),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Sign In".toUpperCase(),
                      style: TextStyle(
                         color: ColorConst.whiteColor,
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    const SizedBox(width: 40.0),
                    Icon(
                      Icons.arrow_forward_sharp,
                      color: ColorConst.whiteColor,
                      size: 18.0,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 30.0,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.red,
                  textColor: Colors.red,
                  onPressed: () {},
                ),
                const SizedBox(width: 10.0),
                MaterialButton(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 30.0,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.indigo,
                  textColor: Colors.indigo,
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}