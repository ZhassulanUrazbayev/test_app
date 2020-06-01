import 'package:equatable/equatable.dart';
import 'package:testenviroment/model/ERC_model.dart';

abstract class ERCEvent extends Equatable {
  const ERCEvent();
}

class SelectItem extends ERCEvent {
  final int index;

  const SelectItem(this.index);

  @override
  List<Object> get props => [];
}