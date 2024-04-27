import 'package:flutter_counter_app/domain/abstracts/operation.dart';
import 'package:flutter_counter_app/domain/enums/operations.dart';

class SubstractOperation extends Operation<num> {
  final num _firstNumber;
  final num _secondNumber;

  SubstractOperation(this._firstNumber, this._secondNumber);

  @override
  num execute() {
    return _firstNumber - _secondNumber;
  }

  @override
  OperationType get type => OperationType.subtract;
}
