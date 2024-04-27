import 'package:flutter_counter_app/domain/abstracts/operation.dart';
import 'package:flutter_counter_app/domain/entities/operation_result.dart';
import 'package:flutter_counter_app/domain/enums/operations.dart';
import 'package:flutter_counter_app/domain/repositories/operations_repository.dart';

class OperationRepositoryMockImpl extends OperationsRepository {
  final List<Operation> _operations = [];
  final List<OperationResult> _results = [];

  @override
  void addOperation(Operation operation) {
    _operations.add(operation);
  }

  @override
  List<Operation> getOperations() {
    return _operations;
  }

  @override
  void clearOperations() {
    _operations.clear();
  }

  @override
  void addResult(OperationResult result) {
    _results.add(result);
  }

  @override
  void clearResults() {
    _results.clear();
  }

  @override
  List<OperationResult> getResults() {
    return [
      OperationResult(0, [0, 0], OperationType.plus),
    ];
  }
}
