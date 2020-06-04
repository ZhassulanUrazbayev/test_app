import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testenviroment/widgets/dash_line_for_sum.dart';

class CurrentPaymentScreen extends StatelessWidget {
  final String assetNameLeftArrow = 'assets/Arrow.svg';
  final String assetNameCloseGrey = 'assets/closeGrey.svg';
  bool lights = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 2.0,
        leading: Padding(
          padding: EdgeInsets.all(17.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset(assetNameLeftArrow,
                color: Color(0xff054BB5), semanticsLabel: 'A red up arrow'),
          ),
        ),
        title: Text(
          "Текущий платеж",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.38,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: <Widget>[
            currentPaymentLine("Сумма договора", 1500000),
            currentPaymentLine("Сумма договора", 1500000),
            currentPaymentLine("Сумма договора", 1500000),
            currentPaymentLine("Сумма договора\n(30.05.2020)", 1500000),
            currentPaymentLine("Сумма договора", 1500000),
            Padding(
              padding: EdgeInsets.only(top: 36.0, bottom: 16.0),
              child: Text(
                "Ваш платеж будет обработан в течение 3-х рабочих дней.",
                maxLines: 2,
                style: TextStyle(
                    fontSize: 15.0,
                    letterSpacing: -0.165,
                    color: Color(0xff777777)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 13.0, bottom: 13.0, left: 16.0, right: 23.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xffF1F1F2)),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "К ОПЛАТЕ",
                          style: TextStyle(
                              fontSize: 13.0,
                              letterSpacing: 0.16,
                              color: Color(0xff777777)),
                        ),
                        Text(
                          "37500.0",
                          style: TextStyle(
                              fontSize: 17.0,
                              letterSpacing: 0.16,
                              color: Colors.black),
                        )
                      ],
                    ),
                    fit: FlexFit.tight,
                  ),
                  SvgPicture.asset(assetNameCloseGrey,
                      semanticsLabel: 'A red up arrow')
                ],
              ),
            ),
            SizedBox(
              height: 33.0,
            ),
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                this.lights = !lights;
                              });
                            },
                            child: Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                  color: lights
                                      ? Color(0xff054BB5)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border(
                                    top: BorderSide(
                                        width: 1.0, color: Color(0xff054BB5)),
                                    left: BorderSide(
                                        width: 1.0, color: Color(0xff054BB5)),
                                    right: BorderSide(
                                        width: 1.0, color: Color(0xff054BB5)),
                                    bottom: BorderSide(
                                        width: 1.0, color: Color(0xff054BB5)),
                                  )),
                              child: lights
                                  ? Icon(
                                Icons.check,
                                size: 22.0,
                                color: Colors.white,
                              )
                                  : Container(),
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Flexible(
                            child: Text(
                              "Я принимаю условия соглашения",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 15.0,
                                  letterSpacing: -0.165,
                                  color: Color(0xff054BB5)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 22.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: () {
                            lights ? Navigator.of(context).pushNamed('/selectPeriodScreen') :
                            showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                    content: Text(
                                        "Для оплаты услуги надо принять условия соглашения"
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("Закрыть"),
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  );
                                }
                            );
                          },
                          color: lights ? Color(0xff054BB5) : Color(0xffEFEFF4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              "Оплатить",
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500,
                                color: lights ? Colors.white : Color(0xff777777),
                                letterSpacing: -0.165,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget currentPaymentLine(String title, int sum) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: 15.0, letterSpacing: 0.41, color: Color(0xff777777)),
          ),
          Flexible(child: MySeparatorForSum()),
          Text(
            "$sum ₸",
            style: TextStyle(
              fontSize: 15.0,
              letterSpacing: 0.41,
            ),
          ),
        ],
      ),
    );
  }
}
