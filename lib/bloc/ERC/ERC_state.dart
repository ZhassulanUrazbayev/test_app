import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:testenviroment/model/ERC_model.dart';

abstract class ERCState extends Equatable {
  const ERCState();

  @override
  List<ERCItem> get props => [];
}

class ERCEmpty extends ERCState {
  final List<ERCItem> cards = [
    ERCItem(ERCTitle: "Отопление", ERCPrice: "uuuiiiiooooo oioi", isSelected: true, payAmount: 15000),
    ERCItem(ERCTitle: "Отопление", ERCPrice: "uuuiiiiooooo oioi", isSelected: true, payAmount: 15000),
    ERCItem(ERCTitle: "Отопление", ERCPrice: "uuuiiiiooooo oioi", isSelected: true, payAmount: 15000),
  ];

  @override
  List<ERCItem> get props => cards;
}

class ERCItemsSelecting extends ERCState {}

class ERCItemsList extends ERCState {
  final List<ERCItem> items;
  final double sum;

  const ERCItemsList({@required this.items, @required this.sum}) : assert(items != null, sum != null);

  @override
  List<ERCItem> get props => items;
}

class ERCError extends ERCState {}