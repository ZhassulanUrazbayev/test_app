import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:testenviroment/model/card_model.dart';


abstract class CardsState extends Equatable {
  const CardsState();

  @override
  List<CardItem> get props => [];
}

class CardsEmpty extends CardsState {}

class CardsAdding extends CardsState {}

class CardsDeleting extends CardsState {}

class CardsSelecting extends CardsState {}

class CardsList extends CardsState {
  final List<CardItem> cards;

  const CardsList({@required this.cards}) : assert(cards != null);

  @override
  List<CardItem> get props => cards;
}

class CardsError extends CardsState {}