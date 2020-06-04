import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:testenviroment/bloc/selectPeriod/select_period_event.dart';
import 'package:testenviroment/bloc/selectPeriod/select_period_state.dart';
import 'package:testenviroment/repository/select_payment_repo.dart';

class SelectPeriodBloc extends Bloc<SelectPeriodEvent, SelectPeriodState> {
  final SelectPeriodRepository _selectPeriodRepository = SelectPeriodRepository();

  @override
  SelectPeriodState get initialState => SelectPeriodEmpty();

  @override
  Stream<SelectPeriodState> mapEventToState(SelectPeriodEvent event) async* {
    if(event is SelectPeriodEmpty){
      yield PeriodSelecting();
      try {
        final bool _isPeriodValid = await _selectPeriodRepository.isPeriodValid();
        final List<int> _firstPeriod = await _selectPeriodRepository.firstPeriod();
        final List<int> _secondPeriod = await _selectPeriodRepository.secondPeriod();
        yield PeriodValidation(isPeriodValid: _isPeriodValid, firstPeriod: _firstPeriod, secondPeriod: _secondPeriod);
      } catch (_) {
        yield PeriodError();
      }
    }
    if(event is SelectStartPeriod){
      yield PeriodSelecting();
      try {
        print("inside bloc " + event.monthIndex.toString()+" "+event.yearIndex.toString());
        await _selectPeriodRepository.selectFirstPeriod(event.monthIndex, event.yearIndex);
        final bool _isPeriodValid = await _selectPeriodRepository.isPeriodValid();
        print("Start Period "+_isPeriodValid.toString());
        final List<int> _firstPeriod = await _selectPeriodRepository.firstPeriod();
        final List<int> _secondPeriod = await _selectPeriodRepository.secondPeriod();
        yield PeriodValidation(isPeriodValid: _isPeriodValid, firstPeriod: _firstPeriod, secondPeriod: _secondPeriod);
      } catch (_) {
        yield PeriodError();
      }
    }
    if(event is SelectEndPeriod){
      yield PeriodSelecting();
      try {
        print("inside bloc end " + event.monthIndex.toString()+" "+event.yearIndex.toString());
        await _selectPeriodRepository.selectSecondPeriod(event.monthIndex, event.yearIndex);
        final bool _isPeriodValid = await _selectPeriodRepository.isPeriodValid();
        print("End Period "+_isPeriodValid.toString());
        final List<int> _firstPeriod = await _selectPeriodRepository.firstPeriod();
        final List<int> _secondPeriod = await _selectPeriodRepository.secondPeriod();
        yield PeriodValidation(isPeriodValid: _isPeriodValid, firstPeriod: _firstPeriod, secondPeriod: _secondPeriod);
      } catch (_) {
        yield PeriodError();
      }
    }
  }
}