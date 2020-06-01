import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:testenviroment/bloc/ERC/ERC_event.dart';
import 'package:testenviroment/bloc/ERC/ERC_state.dart';
import 'package:testenviroment/model/ERC_model.dart';
import 'package:testenviroment/repository/ERC_repo.dart';

class ERCBloc extends Bloc<ERCEvent, ERCState> {
  final ERCRepository _ercRepository = ERCRepository();

  @override
  ERCState get initialState => ERCEmpty();

  @override
  Stream<ERCState> mapEventToState(ERCEvent event) async* {
    if(event is SelectItem){
      yield ERCItemsSelecting();
      try {
        final List<ERCItem> items = await _ercRepository.selectERCItem(event.index);
        final double sum = await _ercRepository.getSum();
        yield ERCItemsList(items: items, sum: sum);
      } catch (_) {
        yield ERCError();
      }
    }
  }
}