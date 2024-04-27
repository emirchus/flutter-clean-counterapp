import 'package:flutter_counter_app/domain/abstracts/operation.dart';
import 'package:flutter_counter_app/domain/enums/operations.dart';

class SumOperation extends Operation<num> {
  final num _firstNumber;
  final num _secondNumber;

  SumOperation(this._firstNumber, this._secondNumber);

  @override
  num execute() {
    return _firstNumber + _secondNumber;
  }

  @override
  OperationType get type => OperationType.plus;
}
