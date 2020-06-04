import 'package:equatable/equatable.dart';

abstract class ERCEvent extends Equatable {
  const ERCEvent();
}

class SelectItem extends ERCEvent {
  final int index;

  const SelectItem(this.index);

  @override
  List<Object> get props => [];
}