import 'package:flutter_counter_app/domain/abstracts/operation.dart';

abstract class ExecuteOperations<T> {
  T executeAllOperations(List<Operation> operations);
}
