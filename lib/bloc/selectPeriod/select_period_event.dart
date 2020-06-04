import 'package:equatable/equatable.dart';

abstract class SelectPeriodEvent extends Equatable {
  const SelectPeriodEvent();
}

class getFirstPeriod extends SelectPeriodEvent {
  final int monthIndex;
  final int yearIndex;

  const getFirstPeriod(this.monthIndex, this.yearIndex);

  @override
  List<Object> get props => [];
}

class getSecondPeriod extends SelectPeriodEvent {
  final int monthIndex;
  final int yearIndex;

  const getSecondPeriod(this.monthIndex, this.yearIndex);

  @override
  List<Object> get props => [];
}

class SelectStartPeriod extends SelectPeriodEvent {
  final int monthIndex;
  final int yearIndex;

  const SelectStartPeriod(this.monthIndex, this.yearIndex);

  @override
  List<Object> get props => [];
}

class SelectEndPeriod extends SelectPeriodEvent {
  final int monthIndex;
  final int yearIndex;

  const SelectEndPeriod(this.monthIndex, this.yearIndex);

  @override
  List<Object> get props => [];
}