import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SelectPeriodState extends Equatable {
  const SelectPeriodState();

  @override
  List<Object> get props => [true];
}

class SelectPeriodEmpty extends SelectPeriodState {
  @override
  List<Object> get props => [true];
}

class PeriodSelecting extends SelectPeriodState {}

class PeriodValidation extends SelectPeriodState {
  final bool isPeriodValid;
  final List<int> firstPeriod;
  final List<int> secondPeriod;

  const PeriodValidation({@required this.isPeriodValid, @required this.firstPeriod, @required this.secondPeriod}) : assert(
  isPeriodValid != null, firstPeriod != null);

  @override
  List<Object> get props => [isPeriodValid, firstPeriod, secondPeriod];
}

class PeriodError extends SelectPeriodState {}