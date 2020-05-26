import 'dart:math' as math;
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  double _height = 0.0;
  double _width = 0.0;
  final double _minPadding = 24.0;
  double _rightPadding = 24.0;
  double _btnSize = 48.0;
  double _btnY = 0.0;
  double _currentX = 0.0;
  double _currentY = 0.0;

  @override
  Widget build(BuildContext context) {
    if (_height == 0.0)
      setState(() {
        _height = MediaQuery.of(context).size.height;
        _width = MediaQuery.of(context).size.width;
        _btnY = _height / 3 * 2;
      });
    return _height == 0.0
        ? Container()
        : Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        CustomPaint(
          size: Size(_width - _rightPadding, _height),
          painter: CurvedPainter(_btnSize, _btnY),
        ),
        Positioned(
          top: _btnY - _btnSize / 2,
          right: _rightPadding  - _minPadding / 2,
          child: GestureDetector(
            onPanDown: (details) {
              _currentX = details.globalPosition.dx;
              _currentY = details.globalPosition.dy;
            },
            onPanStart: (details) {
              _onDrag(details.globalPosition.dx, details.globalPosition.dy);
            },
            onPanUpdate: (details) {
              _onDrag(details.globalPosition.dx, details.globalPosition.dy);
            },
            child: Material(
              type: MaterialType.circle,
              color: Colors.white,
              elevation: 8.0,
              child: Container(
                width: _btnSize,
                height: _btnSize,
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                  iconSize: _btnSize / 3,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _onDrag(double x, double y) {
    double dx = _currentX - x;
    double dy = _currentY - y;
    _currentX = x;
    _currentY = y;
    setState(() {
      _rightPadding = _rightPadding + dx;
      _rightPadding = math.max(_rightPadding, _minPadding);
      _rightPadding = math.min(_rightPadding, _width - _btnSize);
      _btnY = _btnY - dy;
      _btnY = math.max(_btnY, _btnSize);
      _btnY = math.min(_btnY, _height - _btnSize);
    });
  }
}

class CurvedPainter extends CustomPainter {
  CurvedPainter(this.btnSize, this.btnY);

  final double btnSize;
  final double btnY;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, btnY - btnSize * 2);

    path.cubicTo(size.width, btnY - btnSize * 0.3,
        size.width - btnSize * 0.95, btnY - btnSize * 0.9,
        size.width - btnSize, btnY);
    path.cubicTo(size.width - btnSize * 0.95, btnY + btnSize * 0.9,
        size.width, btnY + btnSize * 0.3,
        size.width, btnY + btnSize * 2);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, 0.0);
    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.green
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(CurvedPainter oldDelegate) =>
      oldDelegate.btnY != btnY;
}

class CurvedPainterLeft extends CustomPainter {
  CurvedPainterLeft(this.btnSize, this.btnY);

  final double btnSize;
  final double btnY;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
//    path.moveTo(0.0, 0.0);
//    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.width);
//    path.lineTo(size.height, 0.0);

//    path.lineTo(size.width, btnY - btnSize * 2);
//    var firstControlPoint = new Offset(size.width / 4, size.height);
//    var firstEndPoint = new Offset(size.width / 2.25, size.height - 30.0);
//    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//        firstEndPoint.dx, firstEndPoint.dy);

//    path.cubicTo(size.width, btnY - btnSize * 0.3,
//        size.width - btnSize * 0.95, btnY - btnSize * 0.9,
//        size.width - btnSize, btnY);
//    path.cubicTo(size.width - btnSize * 0.95, btnY + btnSize * 0.9,
//        size.width, btnY + btnSize * 0.3,
//        size.width, btnY + btnSize * 2);

//    path.cubicTo(size.width, btnY - btnSize * 0.3,
//        size.width - btnSize * 0.95, btnY - btnSize * 0.9,
//        size.width - btnSize, btnY);
//    path.cubicTo(size.width - btnSize * 0.95, btnY + btnSize * 0.9,
//        size.width, btnY + btnSize * 0.3,
//        size.width, btnY + btnSize * 2);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, 0.0);
    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.green
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(CurvedPainterLeft oldDelegate) =>
      oldDelegate.btnY != btnY;
}