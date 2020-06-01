import 'package:equatable/equatable.dart';

class CardItem extends Equatable {
  String cardNumber;
  bool isSelected;

  CardItem({this.cardNumber, this.isSelected});

  @override
  List<Object> get props => [cardNumber, isSelected];
}