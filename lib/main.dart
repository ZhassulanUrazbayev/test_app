import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testenviroment/bloc/receiptERCMonths/receiptERCMonths_bloc.dart';
import 'package:testenviroment/screens/ERC.dart';
import 'package:testenviroment/screens/add_card_first.dart';
import 'package:testenviroment/screens/current_payment.dart';
import 'package:testenviroment/screens/monthPic.dart';
import 'package:testenviroment/screens/paymentPlan.dart';
import 'package:testenviroment/screens/receiptERC.dart';
import 'package:testenviroment/screens/second_test_page.dart';
import 'package:testenviroment/screens/simple_code_screen_one.dart';
import 'package:testenviroment/screens/test_page.dart';
import 'package:testenviroment/services/app_route.dart';
import 'bloc/card/card_bloc.dart';
import 'bloc/receiptERC/receiptERC_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = AppRouter();

  @override
  void dispose() {
    // TODO: implement dispose
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
        onGenerateRoute: _router.onGenerateRoute,
//      home:
//      SecondTestPage(),
//      TestPage(),
//      PaymentPlanScreen(),
//      ERSScreen(),
//      BlocProvider(
//        create: (context) => ReceiptERCMonthsBloc(),
//        child: MonthPicScreen(),
//      ),
//      MonthPicScreen(),
//      BlocProvider(
//        create: (context) => ReceiptERCBloc(),
//        child: ReceiptERSScreen(),
//      ),
//      SecondTestPage(),
//      TestPage(),
//      ERSScreen(),
//      BlocProvider(
//        create: (context) => CardsBloc(),
//        child: ReceiptERSScreen(),
//      ),
    );
  }
}
