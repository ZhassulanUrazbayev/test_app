import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:testenviroment/model/card_model.dart';
import 'package:testenviroment/model/receiptERC_model.dart';

abstract class ReceiptERCMonthsState extends Equatable {
  const ReceiptERCMonthsState();

  @override
  List<ReceiptERCMonthsItem> get props => [];
}

class ReceiptERCMonthsEmpty extends ReceiptERCMonthsState {
  final List<ReceiptERCMonthsItem> receiptERCMonthsItems = [
    ReceiptERCMonthsItem(receiptYear: 2019, months: [
      MonthItem(monthName: "Январь", isSelected: false, isAvailableMonth: true),
      MonthItem(monthName: "Февраль", isSelected: false, isAvailableMonth: true),
      MonthItem(monthName: "Март", isSelected: false, isAvailableMonth: true),
      MonthItem(monthName: "Апрель", isSelected: false, isAvailableMonth: true),
      MonthItem(monthName: "Май", isSelected: true, isAvailableMonth: true),
      MonthItem(monthName: "Июнь", isSelected: false, isAvailableMonth: true),
      MonthItem(monthName: "Июль", isSelected: false, isAvailableMonth: true),
      MonthItem(monthName: "Август", isSelected: false, isAvailableMonth: true),
      MonthItem(monthName: "Сентябрь", isSelected: false, isAvailableMonth: true),
      MonthItem(monthName: "Окрябрь", isSelected: false, isAvailableMonth: true),
      MonthItem(monthName: "Ноябрь", isSelected: false, isAvailableMonth: true),
      MonthItem(monthName: "Декабрь", isSelected: false, isAvailableMonth: true),
    ]),
    ReceiptERCMonthsItem(receiptYear: 2020, months: [
      MonthItem(monthName: "Январь", isSelected: false, isAvailableMonth: true),
      MonthItem(monthName: "Февраль", isSelected: false, isAvailableMonth: true),
      MonthItem(monthName: "Март", isSelected: false, isAvailableMonth: true),
      MonthItem(monthName: "Апрель", isSelected: false, isAvailableMonth: true),
      MonthItem(monthName: "Май", isSelected: true, isAvailableMonth: true),
      MonthItem(monthName: "Июнь", isSelected: false, isAvailableMonth: false),
      MonthItem(monthName: "Июль", isSelected: false, isAvailableMonth: false),
      MonthItem(monthName: "Август", isSelected: false, isAvailableMonth: false),
      MonthItem(monthName: "Сентябрь", isSelected: false, isAvailableMonth: false),
      MonthItem(monthName: "Окрябрь", isSelected: false, isAvailableMonth: false),
      MonthItem(monthName: "Ноябрь", isSelected: false, isAvailableMonth: false),
      MonthItem(monthName: "Декабрь", isSelected: false, isAvailableMonth: false),
    ])
  ];

  @override
  List<ReceiptERCMonthsItem> get props => receiptERCMonthsItems;
}

class ReceiptERCMonthsSelecting extends ReceiptERCMonthsState {}

class ReceiptERCMonthsList extends ReceiptERCMonthsState {
  final List<ReceiptERCMonthsItem> receiptERCMonthsItems;

  const ReceiptERCMonthsList({@required this.receiptERCMonthsItems})
      : assert(receiptERCMonthsItems != null);

  @override
  List<ReceiptERCMonthsItem> get props => receiptERCMonthsItems;
}

class ReceiptERCMonthsError extends ReceiptERCMonthsState {}
