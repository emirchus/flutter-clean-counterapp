import 'package:flutter_counter_app/application/common/substract_operation.dart';
import 'package:flutter_counter_app/application/common/sum_operation.dart';
import 'package:flutter_counter_app/domain/abstracts/operation.dart';
import 'package:flutter_counter_app/domain/enums/operations.dart';

typedef OperationHandler<T> = Map<OperationType, T>;

OperationHandler<Operation<num>> kOperationHandlers = {
  OperationType.plus: SumOperation as Operation<num>,
  OperationType.subtract: SubstractOperation as Operation<num>,
};
