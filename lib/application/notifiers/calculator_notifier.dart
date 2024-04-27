import 'package:flutter/material.dart';
import 'package:flutter_counter_app/domain/abstracts/operation.dart';
import 'package:flutter_counter_app/domain/entities/operation_result.dart';
import 'package:flutter_counter_app/domain/repositories/operations_repository.dart';
import 'package:flutter_counter_app/domain/use_cases/execute_operations.dart';

class CalculatorInheritNotifierImpl extends ChangeNotifier {
  final OperationsRepository _operationsRepository;
  final ExecuteOperations<num> _executeOperations;

  CalculatorInheritNotifierImpl({required OperationsRepository operationsRepository, required ExecuteOperations<num> executeOperatons})
      : _operationsRepository = operationsRepository,
        _executeOperations = executeOperatons;

  static CalculatorInheritNotifierImpl of(BuildContext context) => (context.dependOnInheritedWidgetOfExactType<CalculatorNotifier>())!.notifier!;

  void addOperation(Operation operation) => _operationsRepository.addOperation(operation);

  List<Operation> getOperations() => _operationsRepository.getOperations();

  void clearOperations() => _operationsRepository.clearOperations();

  num executeAllOperations() => _executeOperations.executeAllOperations(_operationsRepository.getOperations());

  void addResult(OperationResult operationResult) => _operationsRepository.addResult(operationResult);

  List<OperationResult> getResults() => _operationsRepository.getResults();

  void clearResults() => _operationsRepository.clearResults();

  void notify() {
    notifyListeners();
  }
}

class CalculatorNotifier extends InheritedNotifier<CalculatorInheritNotifierImpl> {
  const CalculatorNotifier({super.key, super.notifier, required super.child});

  @override
  bool updateShouldNotify(CalculatorNotifier oldWidget) {
    return true;
  }
}
