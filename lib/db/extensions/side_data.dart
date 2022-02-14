import '../database.dart';

const sideOrder = [
  'runner',
  'corp',
];

extension SideDataEx on SideData {
  int get order => sideOrder.indexOf(code);
}