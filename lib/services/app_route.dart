import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testenviroment/bloc/ERC/ERC_bloc.dart';
import 'package:testenviroment/bloc/card/card_bloc.dart';
import 'package:testenviroment/bloc/receiptERC/receiptERC_bloc.dart';
import 'package:testenviroment/bloc/receiptERCMonths/receiptERCMonths_bloc.dart';
import 'package:testenviroment/screens/ERC.dart';
import 'package:testenviroment/screens/add_card_first.dart';
import 'package:testenviroment/screens/current_payment.dart';
import 'package:testenviroment/screens/monthPic.dart';
import 'package:testenviroment/screens/paymentPlan.dart';
import 'package:testenviroment/screens/receiptERC.dart';
import 'package:testenviroment/screens/select_period.dart';
import 'package:testenviroment/screens/test_page.dart';

class AppRouter {
  final _cardsBloc = CardsBloc();
  final _receiptERCBloc = ReceiptERCBloc();
  final _receiptERCMonthsBloc = ReceiptERCMonthsBloc();
  final _ERCBloc = ERCBloc();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>
//              BlocProvider.value(
//            value: _receiptERCMonthsBloc,
//            child:
            TestPage(),
//          ),
        );
      case '/currentPaymentScreen':
        return MaterialPageRoute(
          builder: (_) =>
              CurrentPaymentScreen(),
        );
      case '/selectPeriodScreen':
        return MaterialPageRoute(
          builder: (_) =>
              SelectPeriodPage(),
        );
      case '/paymentPlanScreen':
        return MaterialPageRoute(
          builder: (_) =>
              PaymentPlanScreen(),
        );
      case '/monthPicScreen':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _receiptERCMonthsBloc,
            child: MonthPicScreen(),
          ),
        );
      case '/receiptERSScreen':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _receiptERCBloc,
            child: ReceiptERSScreen(),
          ),
        );
      case '/addCardFirstScreen':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _cardsBloc,
            child: AddCardFirstScreen(),
          ),
        );
      case '/ERSScreen':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _ERCBloc,
            child: ERSScreen(),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _cardsBloc.close();
    _receiptERCBloc.close();
    _receiptERCMonthsBloc.close();
    _ERCBloc.close();
  }
}