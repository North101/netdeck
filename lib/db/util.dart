import 'package:drift/drift.dart';

const trueExpression = Variable(true);
const falseExpression = Variable(false);

Expression<bool?> buildAnd(Iterable<Expression<bool?>> iterable) {
  if (iterable.isEmpty) return trueExpression;
  return iterable.reduce((value, element) => value & element);
}

Expression<bool?> buildOr(Iterable<Expression<bool?>> iterable) {
  if (iterable.isEmpty) return trueExpression;
  return iterable.reduce((value, element) => value | element);
}
