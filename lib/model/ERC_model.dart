import 'package:equatable/equatable.dart';

class ERCItem extends Equatable {
  String ERCTitle;
  String ERCPrice;
  bool isSelected;
  int payAmount;

  ERCItem({this.ERCTitle, this.ERCPrice, this.isSelected, this.payAmount});

  @override
  List<Object> get props => [ERCTitle, ERCPrice, isSelected, payAmount];
}