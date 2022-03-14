import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

class DeckMicroResult {
  const DeckMicroResult({
    required this.id,
    required this.name,
    required this.cards,
  });

  factory DeckMicroResult.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeckMicroResult(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      cards: (json['cards'] as Map).cast<String, int>(),
    );
  }

  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return {
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'cards': cards,
    };
  }

  final String id;
  final String name;
  final Map<String, int> cards;

  @override
  String toString() {
    return (StringBuffer('DeckMicroResult(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
        id,
        name,
        const MapEquality().hash(cards),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeckMicroResult &&
          other.id == id &&
          other.name == name &&
          const MapEquality().equals(other.cards, cards));
}
