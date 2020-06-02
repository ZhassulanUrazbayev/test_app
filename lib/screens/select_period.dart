import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectPeriodPage extends StatefulWidget {
  @override
  _SelectPeriodPage createState() => _SelectPeriodPage();
}

class _SelectPeriodPage extends State<SelectPeriodPage> {
  final String assetNameLeftArrow = 'assets/Arrow.svg';
  final String assetNameLeftArrowGrey = 'assets/rightArrowGrey.svg';
  final String assetNameCheckGreenIcon = 'assets/checkGreenIc.svg';
  final String assetNameCloseGrey = 'assets/closeGrey.svg';
  final String assetNameSwipeHandler = 'assets/swipeHandler.svg';
  bool lights = false;

  int selectedYear = 2;

  int selectedMonth = 6;

  List<String> months = [
    "Январь", "Февраль", "Март",
    "Апрель", "Май", "Июнь",
    "Июль", "Август", "Сентябрь",
    "Октярь", "Ноябрь", "Декабрь",];

  List<String> years = [
    "2018", "2019", "2020"];

  showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {

          double widthPadding = MediaQuery.of(context).size.width;

          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),),),
              child: Wrap(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 26.0, top: 13.0),
                        child: SvgPicture.asset(assetNameSwipeHandler, semanticsLabel: 'A red up arrow'),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height/4,
                              child: CupertinoPicker(
                                backgroundColor: Colors.white,
                                scrollController: FixedExtentScrollController(
                                  initialItem: 5,
                                ),
                                onSelectedItemChanged: (value) {
                                  setState(() {
                                    selectedMonth = value;
                                  });
                                },
                                itemExtent: 32.0,
                                children: months.map((String month){
                                  return Padding(
                                    padding: EdgeInsets.only(left: widthPadding/4),
                                    child: Text(month, style: TextStyle(
                                      fontSize: 23.0,
                                      color: Color(0xff333333),
                                      letterSpacing: 0.7,
                                    ),),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(width: 32.0,),
                          Container(
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.width/3,
                            child: CupertinoPicker(
                              backgroundColor: Colors.white,
                              scrollController: FixedExtentScrollController(
                                initialItem: 2,
                              ),
                              onSelectedItemChanged: (value) {
                                setState(() {
                                  selectedYear = value;
                                });
                              },
                              itemExtent: 32.0,
                              children: years.map((String year){
                                return Padding(
                                  padding: EdgeInsets.only(right: widthPadding/10, left: widthPadding/13),
                                  child: Text(year, style: TextStyle(
                                    fontSize: 23.0,
                                    color: Color(0xff333333),
                                    letterSpacing: 0.7,
                                  ),),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: 16.0,
                          left: 16.0,
                          top: 32.0,
                          bottom: 9.0,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: new RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
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
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }


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
          "Акт сверки для проверки",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.38,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "Выберите отчетный\nпериод",
                maxLines: 2,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 24.0,
                    letterSpacing: 0.41,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            GestureDetector(
              onTap: showPicker,
              child: Container(
                padding: EdgeInsets.only(
                    top: 13.0, bottom: 13.0, left: 16.0, right: 23.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xffF1F1F2)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Выбран период с",
                            style: TextStyle(
                                fontSize: 13.0,
                                letterSpacing: 0.16,
                                color: Color(0xff777777)),
                          ),
                          Text(
                            "${months[selectedMonth]} ${years[selectedYear]}",
                            style: TextStyle(
                                fontSize: 17.0,
                                letterSpacing: 0.16,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    SvgPicture.asset(assetNameCloseGrey,
                        semanticsLabel: 'A red up arrow')
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 40.0),
              child: GestureDetector(
                onTap: showPicker,
                child: Container(
                  padding: EdgeInsets.only(
                      top: 13.0, bottom: 13.0, left: 16.0, right: 23.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xffF1F1F2)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Выбран период с",
                              style: TextStyle(
                                  fontSize: 13.0,
                                  letterSpacing: 0.16,
                                  color: Color(0xff777777)),
                            ),
                            Text(
                              "${months[selectedMonth]} ${years[selectedYear]}",
                              style: TextStyle(
                                  fontSize: 17.0,
                                  letterSpacing: 0.16,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      SvgPicture.asset(assetNameCloseGrey,
                          semanticsLabel: 'A red up arrow')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: new RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/monthPicScreen');
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
          ],
        ),
      ),
    );
  }
}