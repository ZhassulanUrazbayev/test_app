import 'package:equatable/equatable.dart';


class ReceiptERCMonthsItem extends Equatable {
  int receiptYear;
  List<MonthItem> months;

  ReceiptERCMonthsItem({this.receiptYear, this.months});

  @override
  List<Object> get props => [receiptYear, months];
}

class MonthItem extends Equatable {
  String monthName;
  bool isSelected;
  bool isAvailableMonth;

  MonthItem({this.monthName, this.isSelected, this.isAvailableMonth});

  @override
  List<Object> get props => [monthName, isSelected, isAvailableMonth];
}