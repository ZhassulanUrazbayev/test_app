import 'package:testenviroment/model/receiptERC_model.dart';

class ReceiptERCMonthsRepository {
  List<ReceiptERCMonthsItem> _receiptERCMonthsItems = [
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

  Future<List<ReceiptERCMonthsItem>> selectMonth(MonthItem item, int yearIndex) async {
    for (int i = 0; i < _receiptERCMonthsItems[yearIndex].months.length; i++) {
      if(_receiptERCMonthsItems[yearIndex].months[i].monthName == item.monthName){
        _receiptERCMonthsItems[yearIndex].months[i].isSelected = !_receiptERCMonthsItems[yearIndex].months[i].isSelected;
      }else{
        _receiptERCMonthsItems[yearIndex].months[i].isSelected = false;
      }
    }

    return _receiptERCMonthsItems;
  }
}
