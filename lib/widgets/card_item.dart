import 'package:flutter/material.dart';
import 'package:testenviroment/model/card_model.dart';

Widget cardItem(CardItem cardItem) {
  return new Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      new Row(
        children: <Widget>[
          new Container(
            width: 24.0,
            height: 24.0,
            padding: new EdgeInsets.all(4.0),
            margin: new EdgeInsets.all(16.0),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(50.0),
              border: Border.all(color: new Color(0xff007AFF), width: 1.0),
            ),
            child: Visibility(
              visible: cardItem.isSelected,
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
          Expanded(child: Padding(
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
                  "•••• ${cardItem.cardNumber}",
                  style: new TextStyle(
                    color: Color(0xff000000),
                    fontSize: 17.0,
                    letterSpacing: -0.165,
                  ),
                ),
              ],
            ),
          )),
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
