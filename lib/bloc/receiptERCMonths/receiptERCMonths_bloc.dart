import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:testenviroment/bloc/receiptERCMonths/receiptERCMonths_event.dart';
import 'package:testenviroment/bloc/receiptERCMonths/receiptERCMonths_state.dart';
import 'package:testenviroment/model/receiptERC_model.dart';
import 'package:testenviroment/repository/receiptERCMonths_repo.dart';


class ReceiptERCMonthsBloc extends Bloc<ReceiptERCMonthsEvent, ReceiptERCMonthsState> {
  final ReceiptERCMonthsRepository receiptERCMonthsRepository = ReceiptERCMonthsRepository();

  @override
  ReceiptERCMonthsState get initialState => ReceiptERCMonthsEmpty();

  @override
  Stream<ReceiptERCMonthsState> mapEventToState(ReceiptERCMonthsEvent event) async* {
    if(event is SelectMonth){
      yield ReceiptERCMonthsSelecting();
      try {
        final List<ReceiptERCMonthsItem> _receiptERCMonthsItems = await receiptERCMonthsRepository.selectMonth(event.item, event.yearIndex);
        yield ReceiptERCMonthsList(receiptERCMonthsItems: _receiptERCMonthsItems);
      } catch (_) {
        yield ReceiptERCMonthsError();
      }
    }
  }
}