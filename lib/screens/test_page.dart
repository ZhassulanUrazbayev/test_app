import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testenviroment/widgets/curve_sample.dart';

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
                SizedBox(width: 10.0,),
                CustomPaint(
                  size: Size(20.0, 30.0),
                  painter: CurvedPainterLeft(10.0, 15.0),
                ),
//                SizedBox(width: 20.0,),
                Column(
                  children: <Widget>[
                    Container(
                      height: 110.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0))
                      ),
                    ),
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0))
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

