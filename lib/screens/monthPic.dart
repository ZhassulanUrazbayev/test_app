import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testenviroment/bloc/receiptERCMonths/receiptERCMonths_bloc.dart';
import 'package:testenviroment/bloc/receiptERCMonths/receiptERCMonths_event.dart';
import 'package:testenviroment/bloc/receiptERCMonths/receiptERCMonths_state.dart';
import 'package:testenviroment/model/receiptERC_model.dart';

class MonthPicScreen extends StatefulWidget {
  @override
  _MonthPicScreenState createState() => _MonthPicScreenState();
}

class _MonthPicScreenState extends State<MonthPicScreen> {
  final String assetNameLeftArrow = 'assets/Arrow.svg';

  final String assetNameLeftArrowGrey = 'assets/rightArrowGrey.svg';

  final String assetNameBottomArrow = 'assets/bottomArrow.svg';

  final String assetNameTopArrow = 'assets/topArrow.svg';

  List<bool> expandStatus;

  @override
  Widget build(BuildContext context) {
    final ReceiptERCMonthsBloc receiptERCMonthsBloc =
        BlocProvider.of<ReceiptERCMonthsBloc>(context);

    return Scaffold(
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
        body: BlocBuilder<ReceiptERCMonthsBloc, ReceiptERCMonthsState>(
            builder: (context, state) {
          if (state is ReceiptERCMonthsEmpty) {

            expandStatus = List.generate(state.receiptERCMonthsItems.length, (_) => false);
            expandStatus.last = true;

            return SingleChildScrollView(
              child: Column(
                  children: <Widget>[
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.receiptERCMonthsItems.length,
                    itemBuilder: (context, index) {
                      return !expandStatus[index] ? Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                print(expandStatus);
                                expandStatus[index] = !expandStatus[index];
                                print(expandStatus);
                              });
                            },
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(
                                  left: 16.0, top: 21.0, bottom: 21.0, right: 26.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      state.receiptERCMonthsItems[index].receiptYear.toString(),
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.41,
                                        color: Color(0xff333333),
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset(assetNameBottomArrow,
                                      color: Color(0xff054BB5),
                                      semanticsLabel: 'A red up arrow'),
                                ],
                              ),
                            ),
                          ),
                          divider(),
                        ],
                      ) : Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                expandStatus[index] = !expandStatus[index];
                              });
                            },
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(
                                  left: 16.0, top: 21.0, bottom: 11.0, right: 26.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      state.receiptERCMonthsItems[index].receiptYear.toString(),
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.41,
                                        color: Color(0xff333333),
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset(assetNameTopArrow,
                                      color: Color(0xff054BB5),
                                      semanticsLabel: 'A red up arrow'),
                                ],
                              ),
                            ),
                          ),
                          divider(),
                          Container(
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                GridView.count(
                                  shrinkWrap: true,
                                  crossAxisCount: 3,
                                  childAspectRatio: 1.59,
                                  mainAxisSpacing: 10.0,
                                  crossAxisSpacing: 10.0,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 10.0),
                                  children:
                                  state.receiptERCMonthsItems[index].months.map((MonthItem monthItem) {
                                    return GridTile(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            boxShadow: monthItem.isAvailableMonth ?  [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.2),
                                                spreadRadius: 3,
                                                blurRadius: 4,
                                                offset: Offset(
                                                    2, 5), // changes position of shadow
                                              ),
                                            ] : [],
                                            color: monthItem.isAvailableMonth ? Colors.white : Color(0xffEFEFF4),
                                            borderRadius: BorderRadius.circular(15.0)),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: (){
                                                receiptERCMonthsBloc.add(SelectMonth(monthItem, index));
                                              },
                                              child: Container(
                                                width: 20.0,
                                                height: 20.0,
                                                padding: EdgeInsets.all(4.0),
                                                margin: EdgeInsets.only(
                                                    left: 13.0, top: 14.0, bottom: 10.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(50.0),
                                                  border: Border.all(
                                                      color: monthItem.isAvailableMonth ? Color(0xff054BB5) : Color(0xff777777),
                                                      width: 1.0),
                                                ),
                                                child: Visibility(
                                                  visible: monthItem.isSelected,
                                                  child: Container(
                                                    height: 10.0,
                                                    width: 10.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xff054BB5),
                                                      borderRadius:
                                                      BorderRadius.circular(30.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsets.only(left: 16.0, bottom: 12.0),
                                              child: Text(
                                                monthItem.monthName,
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  letterSpacing: -0.165,
                                                  color: monthItem.isAvailableMonth ? Color(0xff333333) : Color(0xff777777),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                SizedBox(
                                  height: 11.0,
                                ),
                              ],
                            ),
                          ),
                          divider(),
                        ],
                      );
                    }),
                Padding(
                  padding: new EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 40.0,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: new RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/receiptERSScreen');
                      },
                      color: new Color(0xff054BB5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: new Padding(
                        padding: new EdgeInsets.all(16.0),
                        child: new Text(
                          "Открыть квитанцию",
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
              ]),
            );
          }
          if(state is ReceiptERCMonthsList){
            expandStatus = List.generate(state.receiptERCMonthsItems.length, (_) => false);
            expandStatus.last = true;

            return SingleChildScrollView(
              child: Column(
                  children: <Widget>[
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.receiptERCMonthsItems.length,
                        itemBuilder: (context, index) {
                          return !expandStatus[index] ? Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    print(expandStatus);
                                    expandStatus[index] = !expandStatus[index];
                                    print(expandStatus);
                                  });
                                },
                                child: Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.only(
                                      left: 16.0, top: 21.0, bottom: 21.0, right: 26.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          state.receiptERCMonthsItems[index].receiptYear.toString(),
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.41,
                                            color: Color(0xff333333),
                                          ),
                                        ),
                                      ),
                                      SvgPicture.asset(assetNameBottomArrow,
                                          color: Color(0xff054BB5),
                                          semanticsLabel: 'A red up arrow'),
                                    ],
                                  ),
                                ),
                              ),
                              divider(),
                            ],
                          ) : Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    expandStatus[index] = !expandStatus[index];
                                  });
                                },
                                child: Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.only(
                                      left: 16.0, top: 21.0, bottom: 11.0, right: 26.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          state.receiptERCMonthsItems[index].receiptYear.toString(),
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.41,
                                            color: Color(0xff333333),
                                          ),
                                        ),
                                      ),
                                      SvgPicture.asset(assetNameTopArrow,
                                          color: Color(0xff054BB5),
                                          semanticsLabel: 'A red up arrow'),
                                    ],
                                  ),
                                ),
                              ),
                              divider(),
                              Container(
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    GridView.count(
                                      shrinkWrap: true,
                                      crossAxisCount: 3,
                                      childAspectRatio: 1.59,
                                      mainAxisSpacing: 10.0,
                                      crossAxisSpacing: 10.0,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 10.0),
                                      children:
                                      state.receiptERCMonthsItems[index].months.map((MonthItem monthItem) {
                                        return GridTile(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                boxShadow: monthItem.isAvailableMonth ?  [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.2),
                                                    spreadRadius: 3,
                                                    blurRadius: 4,
                                                    offset: Offset(
                                                        2, 5), // changes position of shadow
                                                  ),
                                                ] : [],
                                                color: monthItem.isAvailableMonth ? Colors.white : Color(0xffEFEFF4),
                                                borderRadius: BorderRadius.circular(15.0)),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                GestureDetector(
                                                  onTap: (){
                                                    receiptERCMonthsBloc.add(SelectMonth(monthItem, index));
                                                  },
                                                  child: Container(
                                                    width: 20.0,
                                                    height: 20.0,
                                                    padding: EdgeInsets.all(4.0),
                                                    margin: EdgeInsets.only(
                                                        left: 13.0, top: 14.0, bottom: 10.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(50.0),
                                                      border: Border.all(
                                                          color: monthItem.isAvailableMonth ? Color(0xff054BB5) : Color(0xff777777),
                                                          width: 1.0),
                                                    ),
                                                    child: Visibility(
                                                      visible: monthItem.isAvailableMonth ? monthItem.isSelected : false,
                                                      child: Container(
                                                        height: 10.0,
                                                        width: 10.0,
                                                        decoration: BoxDecoration(
                                                          color: Color(0xff054BB5),
                                                          borderRadius:
                                                          BorderRadius.circular(30.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(left: 16.0, bottom: 12.0),
                                                  child: Text(
                                                    monthItem.monthName,
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      letterSpacing: -0.165,
                                                      color: monthItem.isAvailableMonth ? Color(0xff333333) : Color(0xff777777),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                    SizedBox(
                                      height: 11.0,
                                    ),
                                  ],
                                ),
                              ),
                              divider(),
                            ],
                          );
                        }),
                    Padding(
                      padding: new EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 40.0,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: new RaisedButton(
                          onPressed: () {
//                        cardsBloc.add(AddCard());
                          },
                          color: new Color(0xff054BB5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: new Padding(
                            padding: new EdgeInsets.all(16.0),
                            child: new Text(
                              "Открыть квитанцию",
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
                  ]),
            );
          }
          return Container();
        }));
  }
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