import 'package:flutter_counter_app/domain/enums/operations.dart';

abstract class Operation<T> {
  OperationType get type;

  T execute();

  @override
  String toString() {
    return type.toString();
  }
}
