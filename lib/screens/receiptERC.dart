import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testenviroment/bloc/receiptERC/receiptERC_bloc.dart';
import 'package:testenviroment/bloc/receiptERC/receiptERC_event.dart';
import 'package:testenviroment/bloc/receiptERC/receiptERC_state.dart';

class ReceiptERSScreen extends StatelessWidget {
  final String assetNameLeftArrow = 'assets/Arrow.svg';
  final String assetNameLeftArrowGrey = 'assets/rightArrowGrey.svg';

  @override
  Widget build(BuildContext context) {
    final ReceiptERCBloc receiptERCBloc =
    BlocProvider.of<ReceiptERCBloc>(context);

    return new Scaffold(
      backgroundColor: Color(0xffE5E5E5),
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
          "Квитанция ЕРЦ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.38,
          ),
        ),
      ),
      body: BlocBuilder<ReceiptERCBloc, ReceiptERCState>(
        builder: (context, state) {
          if (state is ReceiptERCEmpty) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Квитанция за май 2020",
                          style: TextStyle(
                            fontSize: 15.0,
                            letterSpacing: -0.165,
                          ),
                        ),
                      ),
                    ),
                  ),
                  divider(),
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16.0,
                            top: 16.0,
                            bottom: 12.0,
                          ),
                          child: Text(
                            "Информация",
                            style: TextStyle(
                              fontSize: 15.0,
                              letterSpacing: -0.165,
                            ),
                          ),
                        ),
                        detailedText("Лицевой счет", "3641643"),
                        detailedText("ФИО/Адрес", "Арнау 6, Квартира 175"),
                        detailedText("ФИО/Адрес", "Арнау 6, Квартира 175"),
                        detailedText("ФИО/Адрес", "Арнау 6, Квартира 175"),
                        SizedBox(
                          height: 35.0,
                        ),
                      ],
                    ),
                  ),
                  divider(),
                  Container(color: Colors.white, child: overallSum(15000.0)),
                  divider(),
                  SizedBox(
                    height: 16.0,
                  ),
                  divider(),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.cards.length,
                            itemBuilder: (context, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      receiptERCBloc.add(SelectCard(
                                          index));
                                    },
                                    child: Container(
                                      width: 24.0,
                                      height: 24.0,
                                      padding: EdgeInsets.all(4.0),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 17.0, vertical: 22.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(50.0),
                                        border: Border.all(
                                            color: Color(0xff007AFF),
                                            width: 1.0),
                                      ),
                                      child: Visibility(
                                        visible: state.cards[index].isSelected,
                                        child: Container(
                                          height: 14.0,
                                          width: 14.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xff054BB5),
                                            borderRadius:
                                            BorderRadius.circular(30.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Банковская карта".toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              letterSpacing: -0.08,
                                              color: Color(0xff808080),
                                            ),
                                          ),
                                          Text(
                                            "•••• ${state.cards[index].cardNumber}",
                                            style: TextStyle(
                                              color: Color(0xff000000),
                                              fontSize: 17.0,
                                              letterSpacing: -0.165,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 16.0),
                                            child: divider(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 21.0, horizontal: 16.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushNamed('/addCardFirstScreen');
                            },
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "Привязать карту",
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      letterSpacing: 0.16,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                SvgPicture.asset(assetNameLeftArrowGrey,
                                    semanticsLabel: 'left grey arrow')
                              ],
                            ),
                          ),
                        ),
                        divider()
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 40.0,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/ERSScreen');
                        },
                        color: Color(0xff054BB5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Оплатить 15 819,25 ₸",
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.165,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is ReceiptERCCardsList) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Квитанция за май 2020",
                          style: TextStyle(
                            fontSize: 15.0,
                            letterSpacing: -0.165,
                          ),
                        ),
                      ),
                    ),
                  ),
                  divider(),
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16.0,
                            top: 16.0,
                            bottom: 12.0,
                          ),
                          child: Text(
                            "Информация",
                            style: TextStyle(
                              fontSize: 15.0,
                              letterSpacing: -0.165,
                            ),
                          ),
                        ),
                        detailedText("Лицевой счет", "3641643"),
                        detailedText("ФИО/Адрес", "Арнау 6, Квартира 175"),
                        detailedText("ФИО/Адрес", "Арнау 6, Квартира 175"),
                        detailedText("ФИО/Адрес", "Арнау 6, Квартира 175"),
                        SizedBox(
                          height: 35.0,
                        ),
                      ],
                    ),
                  ),
                  divider(),
                  Container(color: Colors.white, child: overallSum(15000.0)),
                  divider(),
                  SizedBox(
                    height: 16.0,
                  ),
                  divider(),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.cards.length,
                            itemBuilder: (context, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      receiptERCBloc.add(SelectCard(
                                          index));
                                    },
                                    child: Container(
                                      width: 24.0,
                                      height: 24.0,
                                      padding: EdgeInsets.all(4.0),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 17.0, vertical: 22.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(50.0),
                                        border: Border.all(
                                            color: Color(0xff007AFF),
                                            width: 1.0),
                                      ),
                                      child: Visibility(
                                        visible: state.cards[index].isSelected,
                                        child: Container(
                                          height: 14.0,
                                          width: 14.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xff054BB5),
                                            borderRadius:
                                            BorderRadius.circular(30.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Банковская карта".toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              letterSpacing: -0.08,
                                              color: Color(0xff808080),
                                            ),
                                          ),
                                          Text(
                                            "•••• ${state.cards[index].cardNumber}",
                                            style: TextStyle(
                                              color: Color(0xff000000),
                                              fontSize: 17.0,
                                              letterSpacing: -0.165,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 16.0),
                                            child: divider(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed('/addCardFirstScreen');
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 21.0, horizontal: 16.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "Привязать карту",
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      letterSpacing: 0.16,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                SvgPicture.asset(assetNameLeftArrowGrey,
                                    semanticsLabel: 'left grey arrow')
                              ],
                            ),
                          ),
                        ),
                        divider()
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 40.0,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/ERSScreen');
                        },
                        color: Color(0xff054BB5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Оплатить 15 819,25 ₸",
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.165,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 40.0,
            ),
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {},
                color: Color(0xff054BB5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Оплатить 15 819,25 ₸",
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: -0.165,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget detailedText(String title, String content) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 5.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15.0,
                letterSpacing: -0.41,
                color: Color(0xff777777),
              ),
            ),
          ),
          Text(
            content,
            style: TextStyle(
              fontSize: 15.0,
              letterSpacing: -0.41,
              color: Color(0xff333333),
            ),
          )
        ],
      ),
    );
  }

  Widget overallSum(double sum) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "К оплате",
              style: TextStyle(
                fontSize: 15.0,
                letterSpacing: -0.165,
                color: Color(0xff000000),
              ),
            ),
          ),
          Text(
            "$sum ₸",
            style: TextStyle(
              fontSize: 15.0,
              letterSpacing: -0.165,
              color: Color(0xff000000),
            ),
          )
        ],
      ),
    );
  }

  Widget divider() {
    return Container(
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