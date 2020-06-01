import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testenviroment/bloc/ERC/ERC_bloc.dart';
import 'package:testenviroment/bloc/ERC/ERC_event.dart';
import 'package:testenviroment/bloc/ERC/ERC_state.dart';

class ERSScreen extends StatefulWidget {
  @override
  _ERSScreenState createState() => _ERSScreenState();
}

class _ERSScreenState extends State<ERSScreen> {
  final String assetNameLeftArrow = 'assets/Arrow.svg';

  final String assetNameLeftArrowGrey = 'assets/rightArrowGrey.svg';

  @override
  Widget build(BuildContext context) {
    final ERCBloc ersBloc =
    BlocProvider.of<ERCBloc>(context);

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
          "ЕРЦ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.38,
          ),
        ),
      ),
      body: BlocBuilder<ERCBloc, ERCState>(
          builder: (context, state) {
            if (state is ERCEmpty){
             return SingleChildScrollView(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   ListView.builder(
                       shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                       itemCount: state.cards.length,
                       itemBuilder: (context, index) {
                         return Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             Visibility(
                               child: divider(),
                               visible: index != 0,
                             ),
                             Container(
                               color: Colors.white,
                               child: Padding(
                                 padding: EdgeInsets.symmetric(
                                     horizontal: 16.0, vertical: 14.0),
                                 child: Row(
                                   children: <Widget>[
                                     Expanded(
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: <Widget>[
                                           Text(
                                             state.cards[index].ERCTitle,
                                             style: TextStyle(
                                                 color: Color(0xff000000),
                                                 fontSize: 15.0,
                                                 letterSpacing: -0.165,
                                                 fontWeight: FontWeight.w500),
                                           ),
                                           Text(
                                             state.cards[index].ERCPrice,
                                             style: TextStyle(
                                                 color: Color(0xff777777),
                                                 fontSize: 13.0,
                                                 letterSpacing: -0.165,
                                                 fontWeight: FontWeight.w500),
                                           ),
                                         ],
                                       ),
                                     ),
                                     CupertinoSwitch(
                                       activeColor: Color(0xff4CD964),
                                       trackColor: Color(0xffE5E5EA),
                                       value: state.cards[index].isSelected,
                                       onChanged: (bool value) {
                                         setState(() {
                                           ersBloc.add(SelectItem(index));
                                         });
                                       },
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                             divider(),
                             overallSum(state.cards[index].payAmount.toDouble()),
                             divider(),
                             SizedBox(
                               height: 16.0,
                             ),
                           ],
                         );
                       }),
                   Padding(
                     padding: new EdgeInsets.symmetric(
                       horizontal: 16.0,
                       vertical: 19.0,
                     ),
                     child: SizedBox(
                       width: double.infinity,
                       child: new RaisedButton(
                         onPressed: () {
                           Navigator.of(context).pushNamed('/paymentPlanScreen');
                         },
                         color: new Color(0xff054BB5),
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10)),
                         child: new Padding(
                           padding: new EdgeInsets.all(16.0),
                           child: new Text(
                             "К оплате 15000.0 ₸",
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
            if (state is ERCItemsList){
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Visibility(
                                child: divider(),
                                visible: index != 0,
                              ),
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 14.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              state.items[index].ERCTitle,
                                              style: TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 15.0,
                                                  letterSpacing: -0.165,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              state.items[index].ERCPrice,
                                              style: TextStyle(
                                                  color: Color(0xff777777),
                                                  fontSize: 13.0,
                                                  letterSpacing: -0.165,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      CupertinoSwitch(
                                        activeColor: Color(0xff4CD964),
                                        trackColor: Color(0xffE5E5EA),
                                        value: state.items[index].isSelected,
                                        onChanged: (bool value) {
                                          setState(() {
                                            ersBloc.add(SelectItem(index));
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              divider(),
                              overallSum(state.items[index].payAmount.toDouble()),
                              divider(),
                              SizedBox(
                                height: 16.0,
                              ),
                            ],
                          );
                        }),
                    Padding(
                      padding: new EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 19.0,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: new RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/paymentPlanScreen');
                          },
                          color: new Color(0xff054BB5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: new Padding(
                            padding: new EdgeInsets.all(16.0),
                            child: new Text(
                              "К оплате ${state.sum} ₸",
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
            return Container();
          }),
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
    return Container(
      color: Colors.white,
      child: Padding(
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
