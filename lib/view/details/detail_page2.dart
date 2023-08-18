import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';

class DetailPage2 extends StatefulWidget {
  @override
  _DetailPage2State createState() => _DetailPage2State();
}

class _DetailPage2State extends State<DetailPage2> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final List<String> list = [
      'https://m.media-amazon.com/images/M/MV5BNDBhNDJiMWEtOTg4Yi00NTYzLWEzOGMtMjNmNjAxNTBlMzY3XkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_UY209_CR2,0,140,209_AL_.jpg',
      'https://m.media-amazon.com/images/M/MV5BMTU5OTczMTcxMV5BMl5BanBnXkFtZTcwNDg3MTEzMw@@._V1_UY209_CR1,0,140,209_AL_.jpg',
      'https://m.media-amazon.com/images/M/MV5BMjA4NDI0MTIxNF5BMl5BanBnXkFtZTYwNTM0MzY2._V1_UY209_CR0,0,140,209_AL_.jpg',
      'https://m.media-amazon.com/images/M/MV5BNzg1MDQxMTQ2OF5BMl5BanBnXkFtZTcwMTk3MjAzOQ@@._V1_UY209_CR0,0,140,209_AL_.jpg',
      'https://m.media-amazon.com/images/M/MV5BMTg0NTIzMjQ1NV5BMl5BanBnXkFtZTcwNDc3MzM5OQ@@._V1_UY209_CR0,0,140,209_AL_.jpg'
    ];
    String desc =
        'Hugh Michael Jackman (born 12 October 1968)[1] is an Australian actor, singer, and producer. '
        'Jackman has won international recognition for his roles in a variety of film genres. '
        'He is known for his long-running role as Wolverine in the X-Men film series, as well as for his lead roles in films such as the romantic-comedy fantasy Kate & Leopold (2001), '
        'the action-horror film Van Helsing (2004), the magic-themed drama The Prestige (2006), '
        'the epic fantasy drama The Fountain (2006), the epic historical romantic drama Australia (2008), '
        'the film version of Les Misérables (2012), the thriller Prisoners (2013), and the musical The Greatest Showman (2017). '
        'His work in Les Misérables earned him his first Academy Award nomination for Best Actor and his first Golden Globe Award for Best Actor – Motion Picture Musical or Comedy in 2013.';

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment(
            0.0, 1.0), // 10% of the width, so there are ten blinds.
        colors: [
          Color(0xFFC5C5C5),
          Color(0xFFFFFFFF),
        ], // whitish to gray
        tileMode: TileMode.clamp, // repeats the gradient over the canvas
      )),
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: ArcClipper(),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  AssetsConst.DEEPAK_IMG,
                  fit: BoxFit.cover,
                  width: _width,
                  height: _height / 2.5,
                  colorBlendMode: BlendMode.darken,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding:
                  EdgeInsets.only(top: _height / 3.6, right: _width / 20),
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.black87,
                child: const Icon(Icons.add),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _height / 3.3, left: _width / 20),
            child: Material(
              elevation: 15.0,
              color: Colors.transparent,
              borderRadius:
                  BorderRadius.all(Radius.circular(_height / 12)),
              child: CircleAvatar(
                  backgroundImage: const AssetImage(
                    AssetsConst.BABY_IMG,
                  ),
                  radius: _height / 12),
            ),
          ),
          Scaffold(
            appBar: AppBar(
              title: const Text(StringConst.DEEPAK_SHARMA),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_outlined),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              actions: <Widget>[
                IconButton(
                    icon: const Icon(Icons.search_rounded), onPressed: () {})
              ],
            ),
            backgroundColor: Colors.transparent,
            body: Container(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: _width / 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: _height / 30,
                        ),
                        const Text(
                          'Hugh Jackman',
                          style: TextStyle(
                              fontSize: 18.0, color: Colors.white),
                        ),
                        SizedBox(
                          height: _height / 100,
                        ),
                        Row(
                          children: <Widget>[
                            SHLabel(
                              label: 'ACTOR',
                            ),
                            SHLabel(
                              label: 'PRODUCER',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _height / 50,
                        ),
                        Row(
                          children: <Widget>[
                            const Text(
                              'MOVIES',
                              style: TextStyle(
                                  fontSize: 10.0, color: Colors.white),
                            ),
                            SizedBox(
                              width: _width / 30,
                            ),
                            const Text(
                              '56  ',
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: _width / 30,
                            ),
                            const Text(
                              'PLAYS',
                              style: TextStyle(
                                  fontSize: 10.0, color: Colors.white),
                            ),
                            SizedBox(
                              width: _width / 30,
                            ),
                            const Text(
                              '29  ',
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: _width / 30,
                            ),
                            const Text(
                              'MUSICLS',
                              style: TextStyle(
                                  fontSize: 10.0, color: Colors.white),
                            ),
                            SizedBox(
                              width: _width / 30,
                            ),
                            const Text(
                              '11  ',
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: _height / 3.5, left: _width / 2.2),
                    child: Row(
                      children: <Widget>[
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'FOLLOWERS',
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '3.5K',
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: _width / 15,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'FOLLOWING',
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '1.9K',
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: _height / 2.8,
                        left: _width / 20,
                        right: _width / 20,
                        bottom: _height / 8),
                    child: Container(
                      child: SingleChildScrollView(
                        child: Text(
                          desc,
                          style: const TextStyle(
                              fontSize: 10.0, fontStyle: FontStyle.normal),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
//                          height: _height / 4,
                          margin: EdgeInsets.only(
                              left: _width / 20, right: _width / 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withAlpha(70),
                                    offset: const Offset(0.0, -10.0),
                                    blurRadius: 10.0),
                              ],
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(5.0))),
                          padding: EdgeInsets.all(_width / 40),
                          child: Column(
                            children: <Widget>[
                              const Row(
                                children: <Widget>[
                                  Text(
                                    'MOVIES',
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '...',
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.right,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: _height / 5,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Container(
                                        width: _width / 4,
                                        height: _height / 6,
                                        margin: EdgeInsets.all(_width / 40),
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(5.0)),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    '${list[index % list.length]}'),
                                                fit: BoxFit.cover)));
                                  },
                                  scrollDirection: Axis.horizontal,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: _height / 40,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SHLabel extends StatelessWidget {
  String? label;

  SHLabel({this.label});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(8.0))),
      margin: const EdgeInsets.only(right: 4.0),
      child: Text(
        label!,
        style: const TextStyle(fontSize: 10.0, color: Colors.white),
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, 3 * size.height / 4);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
