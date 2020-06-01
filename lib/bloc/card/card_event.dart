import 'package:equatable/equatable.dart';
import 'package:testenviroment/model/card_model.dart';

abstract class CardsEvent extends Equatable {
  const CardsEvent();
}

class AddCard extends CardsEvent {
  const AddCard();

  @override
  List<Object> get props => [];
}

class SelectCard extends CardsEvent {
  final int index;
  final CardItem item;

  const SelectCard(this.index, this.item);

  @override
  List<Object> get props => [];
}

class DeleteCard extends CardsEvent {
  final int index;

  const DeleteCard(this.index);

  @override
  List<Object> get props => [];
}