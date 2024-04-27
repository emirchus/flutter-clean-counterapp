import 'package:flutter_counter_app/domain/abstracts/operation.dart';
import 'package:flutter_counter_app/domain/use_cases/execute_operations.dart';

class ExecuteOperationsImpl implements ExecuteOperations<num> {
  @override
  num executeAllOperations(List<Operation> operations) {
    num result = 0;
    for (var operation in operations) {
      result = operation.execute();
    }
    return result;
  }
}
