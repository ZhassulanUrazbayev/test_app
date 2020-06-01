import 'package:equatable/equatable.dart';
import 'package:testenviroment/model/card_model.dart';

abstract class ReceiptERCEvent extends Equatable {
  const ReceiptERCEvent();
}

class SelectCard extends ReceiptERCEvent {
  final int index;
  final CardItem item;

  const SelectCard(this.index, this.item);

  @override
  List<Object> get props => [];
}