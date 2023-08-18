import 'dart:math' as Math;
import 'dart:ui';

import 'package:flutter/widgets.dart';

class CircleProgressBar extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final double value;

  const CircleProgressBar({
    Key? key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = this.backgroundColor;
    final foregroundColor = this.foregroundColor;
    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        foregroundPainter: CircleProgressBarPainter(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          percentage: value,
        ),
        child: Container(),
      ),
    );
  }
}

// Draws the progress bar.
class CircleProgressBarPainter extends CustomPainter {
  final double percentage;
  final double strokeWidth;
  final Color backgroundColor;
  final Color foregroundColor;

  CircleProgressBarPainter({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.percentage,
    double? strokeWidth,
  }) : strokeWidth = strokeWidth ?? 6;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final Size constrainedSize = size - Offset(strokeWidth, strokeWidth) as Size;
    final shortestSide = Math.min(constrainedSize.width, constrainedSize.height);
    final foregroundPaint = Paint()
      ..color = foregroundColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final radius = (shortestSide / 2);

    // Start at the top. 0 radians represents the right edge
//    final double startAngle = -(2 * Math.pi * 0.25);
//    final double sweepAngle = (2 * Math.pi * (this.percentage ?? 0));
    const double startAngle = -(2 * Math.pi * 0.25);
    final double sweepAngle = (2 * Math.pi * (percentage ?? 0));
    // Don't draw the background if we don't have a background color
    if (backgroundColor != null) {
      final backgroundPaint = Paint()
        ..color = backgroundColor
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke;
      canvas.drawCircle(center, radius, backgroundPaint);
    }

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final oldPainter = (oldDelegate as CircleProgressBarPainter);
    return oldPainter.percentage != percentage ||
        oldPainter.backgroundColor != backgroundColor ||
        oldPainter.foregroundColor != foregroundColor ||
        oldPainter.strokeWidth != strokeWidth;
  }
}
