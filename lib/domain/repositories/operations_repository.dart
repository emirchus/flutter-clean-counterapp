import 'package:flutter_counter_app/domain/abstracts/operation.dart';
import 'package:flutter_counter_app/domain/entities/operation_result.dart';

abstract class OperationsRepository {
  void addOperation(Operation operation);

  List<Operation> getOperations();

  void addResult(OperationResult result);

  List<OperationResult> getResults();

  void clearResults();

  void clearOperations();
}
