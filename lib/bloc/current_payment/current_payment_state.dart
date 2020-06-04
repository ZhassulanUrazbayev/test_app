import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CurrentPaymentState extends Equatable {
  const CurrentPaymentState();

  @override
  List<Object> get props => [];
}

class CurrentPaymentEmpty extends CurrentPaymentState {}

class AcceptingAgreement extends CurrentPaymentState {}

class AcceptedAgreement extends CurrentPaymentState {
  final bool isAccepted;

  const AcceptedAgreement({@required this.isAccepted}) : assert(isAccepted != null);

  @override
  List<Object> get props => [isAccepted];
}

class CurrentPaymentError extends CurrentPaymentState {}