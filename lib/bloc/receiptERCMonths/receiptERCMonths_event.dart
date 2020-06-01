import 'package:equatable/equatable.dart';
import 'package:testenviroment/model/receiptERC_model.dart';

abstract class ReceiptERCMonthsEvent extends Equatable {
  const ReceiptERCMonthsEvent();
}

class SelectMonth extends ReceiptERCMonthsEvent {
  final MonthItem item;
  final int yearIndex;

  const SelectMonth(this.item, this.yearIndex);

  @override
  List<Object> get props => [];
}