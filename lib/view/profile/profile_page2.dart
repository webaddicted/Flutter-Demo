
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
class ProfilePage2 extends StatefulWidget {
  @override
  State<ProfilePage2> createState() => _ProfilePage2State();
}
const startColor = Color(0xFFaa7ce4);
const endColor = Color(0xFFe46792);
const titleColor = Color(0xff444444);
const textColor = Color(0xFFa9a9a9);
const shadowColor = Color(0xffe9e9f4);
class _ProfilePage2State extends State<ProfilePage2> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: 180,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [startColor, endColor])),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 20),
                      child: IconButton(
                        icon: const Icon(
                          Icons.dehaze,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        'DesignPlanner',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, right: 20),
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListView(
              children: const <Widget>[
                CardHolder(),
                SizedBox(
                  height: 200,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardHolder extends StatelessWidget {
  const CardHolder();


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 150, right: 20, left: 20),
      height: 600,
      width: 400,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: titleColor.withOpacity(.1),
                blurRadius: 20,
                spreadRadius: 10),
          ]),
      child:  const Card(),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage(AssetsConst.DEEPAK_IMG), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                  color: Colors.blueAccent.withOpacity(.2), width: 1)),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          StringConst.WEBADDICTED,
          style: TextStyle(
            color: titleColor,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '2948 posts created',
              style: TextStyle(color: textColor, fontSize: 15),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 12,
              child: VerticalDivider(
                width: 2,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '934 Feedback',
              style: TextStyle(color: textColor, fontSize: 15),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
          width: 320,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 30,
                    spreadRadius: 5)
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'website',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'www.google.com',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: const Icon(
                                Icons.headset,
                                size: 15,
                              ),
                              onPressed: () {}),
                          IconButton(
                              icon: const Icon(
                                Icons.headset,
                                size: 15,
                              ),
                              onPressed: () {}),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const Text(
                'Biography',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                  'Contrary to popular belief, Lorem Ipsum is not simply random text It has roots in a piece of classical Latin literature from 45 BC')
            ],
          ),
        ),
        Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: Divider(
                height: 1,
                color: titleColor.withOpacity(.3),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Material(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(
                        Icons.group_work,
                        color: textColor,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                const Column(
                  children: <Widget>[
                    Text(
                      'Dirbble',
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    Text(
                      '.com/raazcse',
                      style: TextStyle(color: textColor, fontSize: 15),
                    )
                  ],
                ),
                const Spacer(),
                Material(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(
                        Icons.insert_emoticon,
                        color: textColor,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                const Column(
                  children: <Widget>[
                    Text(
                      'Behance',
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    Text(
                      '.net/surjasin',
                      style: TextStyle(color: textColor, fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  width: 14,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
