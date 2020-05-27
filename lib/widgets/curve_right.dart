import 'dart:math' as math;
import 'package:flutter/material.dart';

class RightCurvePainter extends CustomPainter {
  //2
  RightCurvePainter({@required this.color, @required this.avatarRadius});

  //3
  final Color color;
  final double avatarRadius;

  //4
  @override
  void paint(Canvas canvas, Size size) {
//    final shapeBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final shapeBounds = Rect.fromLTWH(0, 0, size.width, size.height);
////2
    final centerAvatar = Offset(shapeBounds.right, shapeBounds.center.dy);
//2
    final avatarBounds =
    Rect.fromCircle(center: centerAvatar, radius: avatarRadius);
//3
    _drawBackground(canvas, shapeBounds, avatarBounds);
  }

  void _drawBackground(Canvas canvas, Rect shapeBounds, Rect avatarBounds) {
    //1
    final paint = Paint()..color = color;

    final backgroundPath = Path()
      ..moveTo(shapeBounds.left, shapeBounds.top)
      ..lineTo(shapeBounds.topRight.dx, shapeBounds.topRight.dy)
      ..arcTo(avatarBounds, math.pi + math.pi / 2, -math.pi, false)
      ..lineTo(shapeBounds.bottomRight.dx, shapeBounds.bottomRight.dy)
      ..lineTo(shapeBounds.bottomLeft.dx, shapeBounds.bottomLeft.dy)
      ..close();

    //9
    canvas.drawPath(backgroundPath, paint);
  }

  //5
  @override
  bool shouldRepaint(RightCurvePainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
