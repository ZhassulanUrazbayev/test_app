import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:testenviroment/bloc/current_payment/current_payment_event.dart';
import 'package:testenviroment/bloc/current_payment/current_payment_state.dart';
import 'package:testenviroment/repository/current_payment_repo.dart';

class CurrentPaymentBloc extends Bloc<CurrentPaymentEvent, CurrentPaymentState> {
  final CurrentPaymentRepository _currentPaymentRepository = CurrentPaymentRepository();

  @override
  CurrentPaymentState get initialState => CurrentPaymentEmpty();

  @override
  Stream<CurrentPaymentState> mapEventToState(CurrentPaymentEvent event) async* {
    if(event is AcceptAgreement){
      yield AcceptingAgreement();
      try {
        final bool _isAccepted = await _currentPaymentRepository.accepting();
        print(_isAccepted.toString()+" _isAccepted");
        yield AcceptedAgreement(isAccepted: _isAccepted);
      } catch (_) {
        yield CurrentPaymentError();
      }
    }
  }
}