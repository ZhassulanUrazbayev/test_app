import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testenviroment/widgets/curve_left.dart';
import 'package:testenviroment/widgets/curve_right.dart';
import 'package:testenviroment/widgets/dash_line.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final String assetNameRightArrow = 'assets/rightArrowIcon.svg';
  final String assetNameCloseIcon = 'assets/closeIcon.svg';
  final String assetNameDocIcon = 'assets/icFile.svg';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          new Padding(
            padding: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: new Container(
              height: 40.0,
              width: 40.0,
              child: new Center(
                child: SvgPicture.asset(assetNameCloseIcon,
                    color: Color(0xff054BB5), semanticsLabel: 'A red up arrow'),
              ),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Color(0xffECF1FA),
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                    ),
                    child: ButtonTheme(
                      minWidth: double.infinity,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                right: 16.0, left: 16.0, top: 16.0),
                            child: MaterialButton(
                              onPressed: () {},
                              height: 24.0,
                              color: Color(0xff71BA2D),
                              child: Text(
                                "Успешная оплата",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                width: 10.0,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(
                                          0, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: CustomPaint(
                                  size: Size(10.0, 24.0), //2
                                  painter: LeftCurvePainter(
                                      color: Colors.white, avatarRadius: 5.0), //3
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  height: 24.0,
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  alignment: Alignment.center,
                                  color: Colors.white,
                                  child: const MySeparator(
                                    color: Color(0xffD9D9D9),
                                  ),
                                ),
                              ),
                              Container(
                                width: 10.0,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 0,
                                      blurRadius: 1,
                                      offset: Offset(
                                          1, 1), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: CustomPaint(
                                  size: Size(10.0, 24.0), //2
                                  painter: RightCurvePainter(
                                      color: Colors.white, avatarRadius: 5.0), //3
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
//                  padding: EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
//          Row(
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              new Container(
//                width: 10.0,
//                decoration: BoxDecoration(
//                  boxShadow: [
//                    BoxShadow(
//                      color: Colors.grey.withOpacity(0.2),
//                      spreadRadius: 1,
//                      blurRadius: 2,
//                      offset: Offset(0, 5), // changes position of shadow
//                    ),
//                  ],
//                ),
//                child: CustomPaint(
//                  size: Size(10.0, 24.0), //2
//                  painter: LeftCurvePainter(
//                      color: Colors.white, avatarRadius: 5.0), //3
//                ),
//              ),
//              new Flexible(
//                child: Container(
//                  height: 24.0,
//                  padding: EdgeInsets.only(bottom: 10.0),
//                  alignment: Alignment.center,
//                  color: Colors.white,
//                  child: const MySeparator(
//                    color: Color(0xffD9D9D9),
//                  ),
//                ),
//              ),
//              new Container(
//                width: 10.0,
//                decoration: BoxDecoration(
//                  boxShadow: [
//                    BoxShadow(
//                      color: Colors.grey.withOpacity(0.2),
//                      spreadRadius: 0,
//                      blurRadius: 1,
//                      offset: Offset(1, 1), // changes position of shadow
//                    ),
//                  ],
//                ),
//                child: CustomPaint(
//                  size: Size(10.0, 24.0), //2
//                  painter: RightCurvePainter(
//                      color: Colors.white, avatarRadius: 5.0), //3
//                ),
//              ),
//            ],
//          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(25.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(1, 8), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new SizedBox(
                        height: 12.0,
                      ),
                      totalReportLine(47000),
                      new SizedBox(
                        height: 12.0,
                      ),
                      reportLineSecondary("С баланса", "118"),
                      new Padding(
                        padding: new EdgeInsets.symmetric(vertical: 16.0),
                        child: new Divider(
                          height: 1.0,
                          color: Color(0xffD9D9D9),
                        ),
                      ),
                      reportLineSecondary("С баланса", "118"),
                      new Padding(
                        padding: new EdgeInsets.symmetric(vertical: 16.0),
                        child: new Divider(
                          height: 1.0,
                          color: Color(0xffD9D9D9),
                        ),
                      ),
                      reportLineItem("С баланса", "118"),
                      new SizedBox(
                        height: 5.0,
                      ),
                      reportLineItem("С карты", "46882"),
                      new SizedBox(
                        height: 5.0,
                      ),
                      new SizedBox(
                        height: 5.0,
                      ),
                      reportLineItem("С карты", "46882"),
                      new SizedBox(
                        height: 5.0,
                      ),
                      new SizedBox(
                        height: 5.0,
                      ),
                      reportLineItem("С карты", "46882"),
                      new SizedBox(
                        height: 5.0,
                      ),
                      new SizedBox(
                        height: 5.0,
                      ),
                      reportLineItem("С карты", "46882"),
                      new SizedBox(
                        height: 32.0,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/currentPaymentScreen');
                  },
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 42.0, bottom: 11.0),
                        child: SvgPicture.asset(assetNameDocIcon,
                            height: 20.0,
                            width: 16.0,
                            color: Color(0xff054BB5),
                            semanticsLabel: 'A red up arrow'),
                      ),
                      Center(
                        child: Text(
                          "Полная квитация",
                          style: TextStyle(
                              fontSize: 17.0,
                              letterSpacing: -0.165,
                              color: Color(0xff054BB5)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget reportLineItem(String title, String value) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Text(
          title,
          style: new TextStyle(
            fontSize: 15.0,
            letterSpacing: -0.41,
            color: Color(0xff777777),
          ),
        ),
        new Text(
          "$value",
          style: new TextStyle(
            fontSize: 15.0,
            color: Color(0xff333333),
          ),
        ),
      ],
    );
  }

  Widget totalReportLine(int amount) {
    var amountFormatted = amount
        .toString()
        .replaceAllMapped(RegExp(r"\d{3}$"), (match) => " ${match.group(0)}")
        .trim();

    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Text(
          "Итог",
          style: new TextStyle(color: Color(0xff777777), fontSize: 24.0),
        ),
        new Text(
          "$amountFormatted ₸",
          style: new TextStyle(
            color: Color(0xff333333),
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
      ],
    );
  }

  Widget reportLineSecondary(String title, String value) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Text(
          title,
          style: new TextStyle(
            fontSize: 15.0,
            letterSpacing: -0.41,
            fontWeight: FontWeight.w500,
            color: Color(0xff777777),
          ),
        ),
        new Text(
          "$value ₸",
          style: new TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.41,
            color: Color(0xff333333),
          ),
        ),
      ],
    );
  }

  Widget reportLine(String title, int amount) {
    var amountFormatted = amount
        .toString()
        .replaceAllMapped(RegExp(r"\d{3}$"), (match) => " ${match.group(0)}")
        .trim();

    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Text(
          title,
          style: new TextStyle(
            color: Color(0xff777777),
          ),
        ),
        new Text(
          "-$amountFormatted ₸",
          style: new TextStyle(
            color: Color(0xff333333),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget cashbackReportLine(int amount) {
    var amountFormatted = amount
        .toString()
        .replaceAllMapped(RegExp(r"\d{3}$"), (match) => " ${match.group(0)}")
        .trim();

    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Text(
          "Кэшбэк 3%",
          style: new TextStyle(color: Color(0xff777777)),
        ),
        new Text(
          "+$amountFormatted ₸",
          style: new TextStyle(
            color: Color(0xff71BA2D),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget requisiteTime(String date, String time) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          "Дата и время:",
          style: new TextStyle(color: Color(0xff777777)),
        ),
        new Text(
          "$date $time",
          style: new TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget requisiteOrderNumber(int amount) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          "Номер заказа:",
          style: new TextStyle(color: Color(0xff777777)),
        ),
        new Text(
          "№ $amount",
          style: new TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
