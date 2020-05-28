import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddCardFirstScreen extends StatefulWidget {
  @override
  _AddCardFirstScreenState createState() => _AddCardFirstScreenState();
}

class _AddCardFirstScreenState extends State<AddCardFirstScreen> {
  final String assetNameLeftArrow = 'assets/Arrow.svg';
  bool _isCardSelected = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        leading: new Padding(
          padding: new EdgeInsets.all(17.0),
          child: new SvgPicture.asset(assetNameLeftArrow,
              color: Color(0xff054BB5), semanticsLabel: 'A red up arrow'),
        ),
        title: new Text(
          "Выбор счета для оплаты",
          style: new TextStyle(
            color: Colors.black,
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.38,
          ),
        ),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          divider(),
          new Padding(
            padding: new EdgeInsets.only(bottom: 8.0),
            child: new Column(
              children: <Widget>[
                cardItem(_isCardSelected)
              ],
            ),
          ),
          addCardBtn()
        ],
      ),
    );
  }

  Widget cardItem(bool isSelected) {
    return new Column(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Row(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _isCardSelected = !_isCardSelected;
                    });
                  },
                  child: new Container(
                    width: 24.0,
                    height: 24.0,
                    padding: new EdgeInsets.all(4.0),
                    margin: new EdgeInsets.all(16.0),
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(50.0),
                      border:
                          Border.all(color: new Color(0xff007AFF), width: 1.0),
                    ),
                    child: Visibility(
                      visible: isSelected,
                      child: new Container(
                        height: 14.0,
                        width: 14.0,
                        decoration: new BoxDecoration(
                          color: new Color(0xff054BB5),
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.symmetric(vertical: 16.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "Банковская карта".toUpperCase(),
                        style: new TextStyle(
                          fontSize: 13.0,
                          letterSpacing: -0.08,
                          color: new Color(0xff808080),
                        ),
                      ),
                      new Text(
                        "•••• 9922",
                        style: new TextStyle(
                          color: Color(0xff000000),
                          fontSize: 17.0,
                          letterSpacing: -0.165,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            new Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: new Text(
                "Удалить",
                style: new TextStyle(
                  fontSize: 15.0,
                  color: new Color(0xff777777),
                ),
              ),
            )
          ],
        ),
        divider(),
      ],
    );
  }

  Widget divider() {
    return new Container(
      height: 1.0,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffCBCBCB),
          ),
        ),
      ),
    );
  }

  Widget addCardBtn() {
    return new Padding(
      padding: new EdgeInsets.all(16.0),
      child: new RaisedButton(
        onPressed: () {},
        color: new Color(0xffECF1FA),
        child: new Padding(
          padding: new EdgeInsets.all(15.0),
          child: new Text(
            "+ Добавить карту",
            style: new TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
              color: new Color(0xff054BB5),
              letterSpacing: -0.165,
            ),
          ),
        ),
      ),
    );
  }
}
