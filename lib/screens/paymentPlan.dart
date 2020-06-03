import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testenviroment/model/pay_plan_month_model.dart';

class PaymentPlanScreen extends StatelessWidget {
  final String assetNameLeftArrow = 'assets/Arrow.svg';
  final String assetNameLeftArrowGrey = 'assets/rightArrowGrey.svg';
  final String assetNameCheckGreenIcon = 'assets/checkGreenIc.svg';
  bool lights = false;

  List<PayPlanItem> list = [
    PayPlanItem(payPlanYear: "2019", payPlanMonths: [
      PayPlanMonthItem(
          monthTitle: "30 декабря", isAvailable: true, payAmount: 37500),
      PayPlanMonthItem(
          monthTitle: "30 декабря", isAvailable: true, payAmount: 37500)
//                PayPlanMonthItem(monthTitle: "30 декабря", isAvailable: true, payAmount: 37500)
//                PayPlanMonthItem(monthTitle: "30 декабря", isAvailable: true, payAmount: 37500)
    ]),
    PayPlanItem(payPlanYear: "2020", payPlanMonths: [
      PayPlanMonthItem(
          monthTitle: "30 декабря", isAvailable: false, payAmount: 37500),
      PayPlanMonthItem(
          monthTitle: "30 декабря", isAvailable: false, payAmount: 37500),
      PayPlanMonthItem(
          monthTitle: "30 декабря", isAvailable: false, payAmount: 37500),
      PayPlanMonthItem(
          monthTitle: "30 декабря", isAvailable: true, payAmount: 37500)
    ])
  ];

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
            onTap: (){
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset(assetNameLeftArrow,
                color: Color(0xff054BB5), semanticsLabel: 'A red up arrow'),
          ),
        ),
        title: Text(
          "График платежей",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.38,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 4,
                          offset: Offset(2, 5), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Сумма договора",
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Color(0xff777777),
                              letterSpacing: -0.165,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "1 500 000 ₸",
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.165,
                                      color: Colors.black),
                                ),
                                Text(
                                  "SCI-ARN-6-39/56-P",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Color(0xff777777),
                                      letterSpacing: -0.165),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 27.0),
                  child: Text(
                    "Оплачено 18 из 36 платежей",
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.165),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.0, bottom: 5.0),
                  child: RoundedProgressBar(
                    height: 5.0,
                    style: RoundedProgressBarStyle(
                      borderWidth: 0,
                      widthShadow: 0,
                      colorProgress: Color(0xff054BB5),
//                backgroundProgress: Colors.black
                    ),
                    borderRadius: BorderRadius.circular(100),
                    percent: 50,
                  ),
                ),
                Text(
                  "Выплачено 675 000 ₸ из 1 350 000 ₸",
                  style: TextStyle(
                      fontSize: 13.0,
                      color: Color(0xff777777),
                      letterSpacing: -0.165),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 29.0, bottom: 7.0),
                  child: Text(
                    "Выплачено 675 000 ₸ из 1 350 000 ₸",
                    style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.41),
                  ),
                ),
                divider(),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 7.0),
                  child: Text(
                    "Выплачено 675 000 ₸ из 1 350 000 ₸",
                    style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.41),
                  ),
                ),
                divider(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32.0, left: 16.0),
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        list[index].payPlanYear,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.41,
                            color: Color(0xff333333)),
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        childAspectRatio: 1.2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        padding: EdgeInsets.only(top: 10.0, bottom: 24.0, right: 15.0),
                        children: list[index]
                            .payPlanMonths
                            .map((PayPlanMonthItem monthItem) {
                          return GridTile(
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: monthItem.isAvailable
                                      ?  [] : [
                                    BoxShadow(
                                      color:
                                      Colors.grey.withOpacity(0.2),
                                      spreadRadius: 3,
                                      blurRadius: 4,
                                      offset: Offset(2,
                                          5), // changes position of shadow
                                    ),
                                  ],
                                  color: monthItem.isAvailable
                                      ? Color(0xffEFEFF4)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: monthItem.isAvailable ? 16.0 : 11.0, top: monthItem.isAvailable ? 20.0 : 12.0, bottom: monthItem.isAvailable ? 15.0 : 8.0),
                                    child: monthItem.isAvailable ? SvgPicture.asset(
                                        assetNameCheckGreenIcon,
                                        semanticsLabel: 'A red up arrow') : Container(
                                        width: 24.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xffEFEFF4),
                                          borderRadius:
                                          BorderRadius.circular(50.0),
                                          border: Border.all(
                                              color: Color(0xffEFEFF4),
                                              width: 1.0),
                                        )
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 16.0, right: 17.0),
                                    child: Text(
                                      monthItem.payAmount.toString(),
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        letterSpacing: -0.165,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 16.0,
                                        bottom: 14.0,
                                        right: 17.0,
                                        top: 4.0),
                                    child: Text(
                                      monthItem.monthTitle,
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        letterSpacing: -0.165,
                                        color: Color(0xff777777),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
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
}