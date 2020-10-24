import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class Signature extends StatefulWidget {
  SignatureState createState() => new SignatureState();
}

class SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];
  ByteData imgBytes= new ByteData(1024);

  Widget build(BuildContext context) {
    return new Stack(
      children: [
        GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            RenderBox referenceBox = context.findRenderObject();
            Offset localPosition =
            referenceBox.globalToLocal(details.globalPosition);

            setState(() {
              _points = new List.from(_points)..add(localPosition);
            });
          },
          onPanEnd: (DragEndDetails details) => _points.add(null),
        ),
        CustomPaint(painter: new SignaturePainter(_points))
      ],
    );
  }

  void saveToImage(List<Offset> points) async {
    final recorder = new ui.PictureRecorder();
    final canvas = new Canvas(recorder,
        new Rect.fromPoints(new Offset(0.0, 0.0), new Offset(200.0, 200.0)));
    Paint paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }

    ui.Picture picture = recorder.endRecording();
    ui.Image img = await picture.toImage(200, 200);
    final pngBytes = await img.toByteData(format: ui.ImageByteFormat.png);
    setState(() {
      imgBytes = pngBytes;
    });
  }
}