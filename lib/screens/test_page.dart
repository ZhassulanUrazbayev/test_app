import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testenviroment/widgets/curve_left.dart';
import 'package:testenviroment/widgets/curve_right.dart';
import 'package:testenviroment/widgets/curve_sample.dart';
import 'dart:math' as math;

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 200.0,
          width: 200.0,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomPaint(
                  size: Size(10.0, 30.0),
                  painter: CurvedPainter(8.0, 15.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                CustomPaint(
                  size: Size(20.0, 30.0),
                  painter: CurvedPainterLeft(10.0, 15.0),
                ),
                SizedBox(
                  width: 20.0,
                ),
                CustomPaint(
                  size: Size(10.0, 15.0), //2
                  painter: LeftCurvePainter(
                      color: Colors.blue, avatarRadius: 5.0), //3
                ),
                CustomPaint(
                  size: Size(10.0, 15.0), //2
                  painter: RightCurvePainter(
                      color: Colors.blue, avatarRadius: 5.0), //3
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//  Widget container(){
//    return new Container(
//      height: 450.0,
//      padding: new EdgeInsets.all(16.0),
//      decoration: new BoxDecoration(
//        borderRadius:
//        BorderRadius.vertical(top: Radius.circular(25.0)),
//        color: Colors.white,
//      ),
//      child: new Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        mainAxisAlignment: MainAxisAlignment.start,
//        children: <Widget>[
//          new Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              new Row(
//                children: <Widget>[
//                  new Container(
//                    height: 40.0,
//                    width: 40.0,
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(15.0),
//                      color: Colors.black,
//                    ),
//                  ),
//                  new SizedBox(
//                    width: 16.0,
//                  ),
//                  new Container(
//                    width: 180.0,
//                    height: 36.0,
//                    child: new Text(
//                      "Дом модной мебели LUSSO",
//                      style: TextStyle(fontSize: 15.0),
//                      maxLines: 2,
//                    ),
//                  )
//                ],
//              ),
//              new Padding(
//                padding: EdgeInsets.only(right: 8.0),
//                child: new SvgPicture.asset(
//                    assetNameRightArrow,
//                    color: Color(0xff054BB5),
//                    semanticsLabel: 'A red up arrow'
//                ),
//              ),
//            ],
//          ),
//          new Padding(
//            padding: EdgeInsets.only(
//                top: 8.0, bottom: 6.0),
//            child: const MySeparator(color: Color(0xffD9D9D9)),
//          ),
//          new ButtonTheme(
//            minWidth: double.infinity,
//            child: new MaterialButton(
//              onPressed: () {},
//              height: 24.0,
//              color: Color(0xff71BA2D),
//              child: new Text(
//                "Успешная оплата",
//                style: new TextStyle(
//                  color: Colors.white,
//                  fontSize: 13.0,
//                  fontWeight: FontWeight.w400,
//                ),
//              ),
//            ),
//          ),
//          reportLine("С баланса", 118),
//          new SizedBox(
//            height: 12.0,
//          ),
//          reportLine("С карты", 46882),
//          new Padding(
//            padding: new EdgeInsets.symmetric(vertical: 16.0),
//            child: new Divider(
//              height: 1.0,
//              color: Color(0xffD9D9D9),
//            ),
//          ),
//          totalReportLine(47000),
//          new SizedBox(
//            height: 12.0,
//          ),
//          cashbackReportLine(7050),
//          new Padding(
//            padding: new EdgeInsets.symmetric(vertical: 16.0),
//            child: new Divider(
//              height: 1.0,
//              color: Color(0xffD9D9D9),
//            ),
//          ),
//          new Text(
//            "Реквизиты платежа",
//            style: TextStyle(
//              fontWeight: FontWeight.bold,
//            ),
//          ),
//          new Padding(
//            padding: EdgeInsets.symmetric(vertical: 8.0),
//            child: requisiteTime("11.05.2020", "15:42:50"),
//          ),
//          requisiteOrderNumber(2309941),
//          new SizedBox(
//            height: 25.0,
//          ),
//        ],
//      ),
//    );
//  }
}

class ProfileCardPainter extends CustomPainter {
  //2
  ProfileCardPainter({@required this.color, @required this.avatarRadius});

  //3
  final Color color;
  final double avatarRadius;

  //4
  @override
  void paint(Canvas canvas, Size size) {
//    final shapeBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final shapeBounds = Rect.fromLTWH(0, 0, size.width, size.height);
////2
//    final paint = Paint()..color = color;
////3
//    canvas.drawRect(shapeBounds, paint);
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

    //2
//    final backgroundPath = Path()
//      ..moveTo(shapeBounds.left, shapeBounds.top) //3
//      ..lineTo(shapeBounds.bottomLeft.dx, shapeBounds.bottomLeft.dy) //4
//      ..arcTo(avatarBounds, -math.pi, math.pi, false) //5
//      ..lineTo(shapeBounds.bottomRight.dx, shapeBounds.bottomRight.dy) //6
//      ..lineTo(shapeBounds.topRight.dx, shapeBounds.topRight.dy) //7
//      ..close(); //8
//    top circle
//    final backgroundPath = Path()
//      ..moveTo(shapeBounds.right, shapeBounds.top)
//      ..arcTo(avatarBounds, 0.0, math.pi, false)
//      ..lineTo(shapeBounds.topLeft.dx, shapeBounds.topLeft.dy)
//      ..lineTo(shapeBounds.bottomLeft.dx, shapeBounds.bottomLeft.dy)
//      ..lineTo(shapeBounds.bottomRight.dx, shapeBounds.bottomRight.dy)
//      ..close();
//    left
//    final centerAvatar = Offset(shapeBounds.left, shapeBounds.center.dy);
//    final backgroundPath = Path()
//      ..moveTo(shapeBounds.right, shapeBounds.top)
//      ..lineTo(shapeBounds.topLeft.dx, shapeBounds.topLeft.dy)
//      ..arcTo(avatarBounds, -math.pi+math.pi/2, math.pi, false)
//      ..lineTo(shapeBounds.bottomLeft.dx, shapeBounds.bottomLeft.dy)
//      ..lineTo(shapeBounds.bottomRight.dx, shapeBounds.bottomRight.dy)
//      ..close();
//        final centerAvatar = Offset(shapeBounds.right, shapeBounds.center.dy);
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
  bool shouldRepaint(ProfileCardPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
