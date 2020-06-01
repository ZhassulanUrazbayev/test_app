import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:testenviroment/model/card_model.dart';
import 'package:testenviroment/repository/card_repo.dart';

import 'card_event.dart';
import 'card_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  final CardsRepository cardsRepository = CardsRepository();

  @override
  CardsState get initialState => CardsEmpty();

  @override
  Stream<CardsState> mapEventToState(CardsEvent event) async* {
    if(event is AddCard){
      yield CardsAdding();
      try {
        final List<CardItem> cards = await cardsRepository.addCard();
        yield CardsList(cards: cards);
      } catch (_) {
        yield CardsError();
      }
    }
    if(event is SelectCard){
      yield CardsSelecting();
      try {
        final List<CardItem> cards = await cardsRepository.selectCard(event.index, event.item);
        yield CardsList(cards: cards);
      } catch (_) {
        yield CardsError();
      }
    }
    if(event is DeleteCard){
      yield CardsDeleting();
      try {
        final List<CardItem> cards = await cardsRepository.deletedCard(event.index);
        yield CardsList(cards: cards);
      } catch (_) {
        yield CardsError();
      }
    }
  }
}