import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:testenviroment/bloc/receiptERC/receiptERC_event.dart';
import 'package:testenviroment/bloc/receiptERC/receiptERC_state.dart';
import 'package:testenviroment/model/card_model.dart';
import 'package:testenviroment/repository/receiptERC_repo.dart';


class ReceiptERCBloc extends Bloc<ReceiptERCEvent, ReceiptERCState> {
  final ReceiptERCRepository receiptERCRepository = ReceiptERCRepository();

  @override
  ReceiptERCState get initialState => ReceiptERCEmpty();

  @override
  Stream<ReceiptERCState> mapEventToState(ReceiptERCEvent event) async* {
    if(event is SelectCard){
      yield ReceiptERCCardsSelecting();
      try {
        final List<CardItem> cards = await receiptERCRepository.selectCard(event.index, event.item);
        yield ReceiptERCCardsList(cards: cards);
      } catch (_) {
        yield ReceiptERCError();
      }
    }
  }
}