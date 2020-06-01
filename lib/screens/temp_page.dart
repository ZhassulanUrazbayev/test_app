import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testenviroment/screens/ERC.dart';
import 'package:testenviroment/screens/add_card_first.dart';
import 'package:testenviroment/screens/receiptERC.dart';
import 'package:testenviroment/screens/second_test_page.dart';
import 'package:testenviroment/screens/simple_code_screen_one.dart';
import 'package:testenviroment/screens/test_page.dart';

class TempPage extends StatelessWidget {
  TempPage(this.tempBloc, this.tempPage);

  final Bloc tempBloc;
  final Widget tempPage;
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
//      BlocProvider(
//        create: (context) => tempBloc(),
//        child: tempPage(),
//      ),
      SecondTestPage(),
//      TestPage(),
//      ERSScreen(),
//      BlocProvider(
//        create: (context) => CardsBloc(),
//        child: ReceiptERSScreen(),
//      ),
    );
  }
}
