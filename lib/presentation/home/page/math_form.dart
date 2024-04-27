import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_counter_app/application/common/substract_operation.dart';
import 'package:flutter_counter_app/application/common/sum_operation.dart';
import 'package:flutter_counter_app/application/notifiers/calculator_notifier.dart';
import 'package:flutter_counter_app/domain/abstracts/operation.dart';
import 'package:flutter_counter_app/domain/entities/operation_result.dart';
import 'package:flutter_counter_app/domain/enums/operations.dart';
import 'package:flutter_counter_app/presentation/ui/input.dart';

class MathForm extends StatefulWidget {
  const MathForm({super.key});

  @override
  State<MathForm> createState() => _MathFormState();
}

class _MathFormState extends State<MathForm> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();

  final TextEditingController _operationController = TextEditingController();

  OperationType? selectedOperation;

  num result = 0;

  @override
  Widget build(BuildContext context) {
    CalculatorInheritNotifierImpl calc = CalculatorInheritNotifierImpl.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 320,
              child: InputWidget(
                controller: _firstController,
                placeholder: "First number",
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: 320,
              child: InputWidget(
                controller: _secondController,
                placeholder: "Second number",
              ),
            ),
            const SizedBox(height: 16.0),
            DropdownMenu<OperationType>(
              width: 320,
              controller: _operationController,
              requestFocusOnTap: true,
              label: const Text('Operation'),
              onSelected: (OperationType? operation) {
                setState(() {
                  selectedOperation = operation;
                });
              },
              dropdownMenuEntries: OperationType.values.map<DropdownMenuEntry<OperationType>>((OperationType color) {
                return DropdownMenuEntry<OperationType>(
                  value: color,
                  label: color.name,
                );
              }).toList(),
            ),
            const SizedBox(height: 22.0),
            SizedBox(
              width: 420,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      clear();
                    },
                    icon: const Icon(Icons.restore),
                    label: const Text("Reset"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      if (_firstController.text.isNotEmpty && _secondController.text.isNotEmpty && selectedOperation != null) {
                        log('First number: ${_firstController.text}');
                        log('Second number: ${_secondController.text}');
                        log('Operation: ${selectedOperation!.name}');

                        num firstNumber = num.parse(_firstController.text);
                        num secondNumber = num.parse(_secondController.text);

                        final Operation operation = selectedOperation == OperationType.plus ? SumOperation(firstNumber, secondNumber) : SubstractOperation(firstNumber, secondNumber);

                        calc.addOperation(operation);
                        result = calc.executeAllOperations();
                        calc.addResult(OperationResult(
                            result,
                            [
                              num.parse(_firstController.text),
                              num.parse(_secondController.text),
                            ],
                            selectedOperation!));
                        await _dialogBuilder(context);
                        clear();
                        calc.clearOperations();
                        calc.notify();
                      }
                    },
                    icon: const Icon(Icons.check),
                    label: const Text("Submit"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Result'),
          content: Text('This is the result of your operation:\n'
              '$result\n'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void clear() {
    setState(() {
      _firstController.clear();
      _secondController.clear();
      _operationController.clear();
      selectedOperation = null;
      result = 0;
    });
  }
}
