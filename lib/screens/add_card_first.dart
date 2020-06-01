import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testenviroment/bloc/card/card_bloc.dart';
import 'package:testenviroment/bloc/card/card_event.dart';
import 'package:testenviroment/bloc/card/card_state.dart';

class AddCardFirstScreen extends StatelessWidget {
  final String assetNameLeftArrow = 'assets/Arrow.svg';

  @override
  Widget build(BuildContext context) {
    final CardsBloc cardsBloc = BlocProvider.of<CardsBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
        appBar:  AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 2.0,
          leading:  Padding(
            padding:  EdgeInsets.all(17.0),
            child:  GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(assetNameLeftArrow,
                  color: Color(0xff054BB5), semanticsLabel: 'A red up arrow'),
            ),
          ),
          title:  Text(
            "Выбор счета для оплаты",
            style:  TextStyle(
              color: Colors.black,
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.38,
            ),
          ),
        ),
        body: BlocBuilder<CardsBloc, CardsState>(
          builder: (context, state) {
            if(state is CardsEmpty){
              return Column(
                children: <Widget>[
                  Padding(
                    padding:  EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child:  RaisedButton(
                        onPressed: () {
                          cardsBloc.add(AddCard());
                        },
                        color:  Color(0xffECF1FA),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child:  Padding(
                          padding:  EdgeInsets.all(15.0),
                          child:  Text(
                            "+ Добавить карту",
                            style:  TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500,
                              color:  Color(0xff054BB5),
                              letterSpacing: -0.165,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            if(state is CardsList){
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 8.0),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.cards.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){
                                    cardsBloc.add(SelectCard(index, state.cards[index]));
                                  },
                                  child:  Container(
                                    width: 24.0,
                                    height: 24.0,
                                    padding:  EdgeInsets.all(4.0),
                                    margin:  EdgeInsets.all(16.0),
                                    decoration:  BoxDecoration(
                                      borderRadius:  BorderRadius.circular(50.0),
                                      border: Border.all(color:  Color(0xff007AFF), width: 1.0),
                                    ),
                                    child: Visibility(
                                      visible: state.cards[index].isSelected,
                                      child:  Container(
                                        height: 14.0,
                                        width: 14.0,
                                        decoration:  BoxDecoration(
                                          color:  Color(0xff054BB5),
                                          borderRadius:  BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 16.0),
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Банковская карта".toUpperCase(),
                                        style:  TextStyle(
                                          fontSize: 13.0,
                                          letterSpacing: -0.08,
                                          color:  Color(0xff808080),
                                        ),
                                      ),
                                      Text(
                                        "•••• ${state.cards[index].cardNumber}",
                                        style:  TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 17.0,
                                          letterSpacing: -0.165,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                                GestureDetector(
                                  onTap: (){
                                    cardsBloc.add(DeleteCard(index));
                                  },
                                  child:  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                                    child:  Text(
                                      "Удалить",
                                      style:  TextStyle(
                                        fontSize: 15.0,
                                        color:  Color(0xff777777),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            divider(),
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding:  EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child:  RaisedButton(
                          onPressed: () {
                            cardsBloc.add(AddCard());
                          },
                          color:  Color(0xffECF1FA),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child:  Padding(
                            padding:  EdgeInsets.all(15.0),
                            child:  Text(
                              "+ Добавить карту",
                              style:  TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500,
                                color:  Color(0xff054BB5),
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
            return Column(
              children: <Widget>[
                Padding(
                  padding:  EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child:  RaisedButton(
                      onPressed: () {
                        cardsBloc.add(AddCard());
                      },
                      color:  Color(0xffECF1FA),
                      child:  Padding(
                        padding:  EdgeInsets.all(15.0),
                        child:  Text(
                          "+ Добавить карту",
                          style:  TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                            color:  Color(0xff054BB5),
                            letterSpacing: -0.165,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
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
