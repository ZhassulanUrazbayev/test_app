import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:testenviroment/model/card_model.dart';


abstract class ReceiptERCState extends Equatable {
  const ReceiptERCState();

  @override
  List<CardItem> get props => [];
}

class ReceiptERCEmpty extends ReceiptERCState {
  final List<CardItem> cards = [
    CardItem(cardNumber: "9988", isSelected: false),
    CardItem(cardNumber: "7812", isSelected: true),
    CardItem(cardNumber: "0015", isSelected: false)
  ];

  @override
  List<CardItem> get props => cards;
}

class ReceiptERCCardsSelecting extends ReceiptERCState {}

class ReceiptERCCardsList extends ReceiptERCState {
  final List<CardItem> cards;

  const ReceiptERCCardsList({@required this.cards}) : assert(cards != null);

  @override
  List<CardItem> get props => cards;
}

class ReceiptERCError extends ReceiptERCState {}