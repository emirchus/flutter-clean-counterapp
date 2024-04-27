import 'package:flutter/material.dart';
import 'package:flutter_counter_app/application/application.dart';
import 'package:flutter_counter_app/application/notifiers/calculator_notifier.dart';
import 'package:flutter_counter_app/application/repositories/operation_repository_impl.dart';
import 'package:flutter_counter_app/application/repositories/operation_repository_mock_impl%20.dart';
import 'package:flutter_counter_app/application/use_cases/execute_operations_impl.dart';
import 'package:flutter_counter_app/domain/repositories/operations_repository.dart';
import 'package:flutter_counter_app/domain/use_cases/execute_operations.dart';

class Injector extends StatefulWidget {
  const Injector({super.key});

  @override
  State<Injector> createState() => _InjectorState();
}

class _InjectorState extends State<Injector> {
  late final OperationsRepository _operationsRepository;
  late final ExecuteOperations<num> _executeOperations;

  @override
  void initState() {
    _operationsRepository = OperationRepositoryMockImpl();
    _executeOperations = ExecuteOperationsImpl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CalculatorNotifier(
      notifier: CalculatorInheritNotifierImpl(operationsRepository: _operationsRepository, executeOperatons: _executeOperations),
      child: const Application(),
    );
  }
}
