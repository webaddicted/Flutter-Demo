import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';

class LoginPage12 extends StatefulWidget {
  @override
  _LoginPage12State createState() => _LoginPage12State();
}

class _LoginPage12State extends State<LoginPage12> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetsConst.bgGirlImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                  foregroundDecoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                if (MediaQuery.of(context).viewInsets == EdgeInsets.zero)
                  const Padding(
                    padding: EdgeInsets.only(top: kToolbarHeight),
                    child: Text(
                      "Beautiful App",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                 Align(
                    alignment: Alignment.bottomCenter,
                    child: ListView(
                      physics:
                      MediaQuery.of(context).viewInsets == EdgeInsets.zero
                          ? const NeverScrollableScrollPhysics()
                          : null,
                      padding: const EdgeInsets.all(32.0),
                      shrinkWrap: true,
                      children: [
                        const SizedBox(height: kToolbarHeight),
                        Text(
                          "Namaste!",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              !.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Welcome to this awesome app. We are so happy that you are using our app.",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20.0),
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 32.0),
                            suffixIcon: const Icon(
                              Icons.person,
                              color: Colors.blueGrey,
                            ),
                            hintText: "Username",
                            hintStyle: const TextStyle(color: Colors.blueGrey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 32.0),
                            suffixIcon: const Icon(
                              Icons.lock,
                              color: Colors.blueGrey,
                            ),
                            hintText: "Password",
                            hintStyle: const TextStyle(color: Colors.blueGrey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        MaterialButton(
                          textColor: Colors.white,
                          child: const Text("Create new account"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          if (MediaQuery.of(context).viewInsets == EdgeInsets.zero)
            MaterialButton(
              padding: const EdgeInsets.all(16.0),
              elevation: 0,
              textColor: Colors.white,
              color: Colors.deepOrange,
              child: Text("Continue".toUpperCase()),
              onPressed: () {},
            )
        ],
      ),
    );
  }
}
