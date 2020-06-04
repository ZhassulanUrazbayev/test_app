import 'package:equatable/equatable.dart';
import 'package:testenviroment/model/card_model.dart';

abstract class ReceiptERCEvent extends Equatable {
  const ReceiptERCEvent();
}

class SelectCard extends ReceiptERCEvent {
  final int index;

  const SelectCard(this.index);

  @override
  List<Object> get props => [];
}