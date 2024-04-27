import 'package:flutter_counter_app/domain/enums/operations.dart';

class OperationResult {
  final OperationType type;
  final List<num> numbers;
  final num result;

  OperationResult(this.result, this.numbers, this.type);
}
