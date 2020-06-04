import 'package:equatable/equatable.dart';

abstract class CurrentPaymentEvent extends Equatable {
  const CurrentPaymentEvent();
}

class AcceptAgreement extends CurrentPaymentEvent {

  const AcceptAgreement();

  @override
  List<Object> get props => [];
}