import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:testenviroment/widgets/curve_sample.dart';
import 'package:testenviroment/widgets/dash_line.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  final String assetNameRightArrow = 'assets/rightArrowIcon.svg';
  final String assetNameCloseIcon = 'assets/closeIcon.svg';

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
                child: SvgPicture.asset(
                    assetNameCloseIcon,
                    color: Color(0xff054BB5),
                    semanticsLabel: 'A red up arrow'
                ),
              ),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Color(0xffECF1FA),
              ),
            ),
          )
        ],
      ),
      body: new Padding(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new SizedBox(
              height: 30.0,
            ),
            new Container(
              height: 450.0,
              padding: new EdgeInsets.all(16.0),
              decoration: new BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ]),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.black,
                            ),
                          ),
                          new SizedBox(
                            width: 16.0,
                          ),
                          new Container(
                            width: 180.0,
                            height: 36.0,
                            child: new Text(
                              "Дом модной мебели LUSSO",
                              style: TextStyle(fontSize: 15.0),
                              maxLines: 2,
                            ),
                          )
                        ],
                      ),
                      new Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: new SvgPicture.asset(
                            assetNameRightArrow,
                            color: Color(0xff054BB5),
                            semanticsLabel: 'A red up arrow'
                        ),
                      ),
                    ],
                  ),
                  new Padding(
                    padding: EdgeInsets.only(
                        top: 8.0, bottom: 6.0),
                    child: const MySeparator(color: Color(0xffD9D9D9)),
                  ),
                  new ButtonTheme(
                    minWidth: double.infinity,
                    child: new MaterialButton(
                      onPressed: () {},
                      height: 24.0,
                      color: Color(0xff71BA2D),
                      child: new Text(
                        "Успешная оплата",
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  reportLine("С баланса", 118),
                  new SizedBox(
                    height: 12.0,
                  ),
                  reportLine("С карты", 46882),
                  new Padding(
                    padding: new EdgeInsets.symmetric(vertical: 16.0),
                    child: new Divider(
                      height: 1.0,
                      color: Color(0xffD9D9D9),
                    ),
                  ),
                  totalReportLine(47000),
                  new SizedBox(
                    height: 12.0,
                  ),
                  cashbackReportLine(7050),
                  new Padding(
                    padding: new EdgeInsets.symmetric(vertical: 16.0),
                    child: new Divider(
                      height: 1.0,
                      color: Color(0xffD9D9D9),
                    ),
                  ),
                  new Text(
                    "Реквизиты платежа",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: requisiteTime("11.05.2020", "15:42:50"),
                  ),
                  requisiteOrderNumber(2309941),
                  new SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            ),
            new Container(
              height: 50,
              child: Center(
                child: Text("Спасибо за покупку", style: new TextStyle(color: Color(0xff777777), fontWeight: FontWeight.bold, fontSize: 17.0,),),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
