import 'package:flutter/material.dart';
import 'package:flutter_counter_app/application/notifiers/calculator_notifier.dart';
import 'package:flutter_counter_app/domain/entities/operation_result.dart';
import 'package:flutter_counter_app/domain/enums/operations.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    CalculatorInheritNotifierImpl calc = CalculatorInheritNotifierImpl.of(context);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const SizedBox(
            width: 500,
            child: Card(
              child: ListTile(
                title: Text('Results'),
                subtitle: Text('This is the list of all the results of your operations'),
              ),
            ),
          ),
          SizedBox(
            width: 500,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: calc.getResults().length,
              itemBuilder: (BuildContext context, int index) {
                OperationResult operationResult = calc.getResults()[index];
                return Card(
                  child: ListTile(
                    leading: Icon(operationResult.type == OperationType.plus ? Icons.add_circle : Icons.remove_circle),
                    title: Text('Result: ${operationResult.result}', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                    subtitle: Text('Number 1: ${operationResult.numbers[0]}\nNumber 2: ${operationResult.numbers[1]}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
