import 'package:equatable/equatable.dart';

class PayPlanItem extends Equatable {
  String payPlanYear;
  List<PayPlanMonthItem> payPlanMonths;

  PayPlanItem({this.payPlanYear, this.payPlanMonths});

  @override
  List<Object> get props => [payPlanYear, payPlanMonths];
}

class PayPlanMonthItem extends Equatable {
  String monthTitle;
  bool isAvailable;
  int payAmount;

  PayPlanMonthItem({this.monthTitle, this.isAvailable, this.payAmount});

  @override
  List<Object> get props => [monthTitle, isAvailable, payAmount];
}