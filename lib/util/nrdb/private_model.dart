import 'package:freezed_annotation/freezed_annotation.dart';

part 'private_model.freezed.dart';
part 'private_model.g.dart';

@Freezed(fromJson: true)
class NrdbDeckResult with _$NrdbDeckResult {
  const factory NrdbDeckResult.success(
    String versionNumber,
    bool success,
    NrdbDeck data,
    int total,
  ) = NrdbDeckSuccessResult;

  const factory NrdbDeckResult.failure(
    String versionNumber,
    bool success,
    String msg,
  ) = NrdbDeckFailureResult;

  factory NrdbDeckResult.fromJson(Map<String, dynamic> json) {
    final success = json['success'];
    if (success is bool) {
      if (success) {
        return NrdbDeckSuccessResult.fromJson(json);
      } else {
        return NrdbDeckFailureResult.fromJson(json);
      }
    }
    throw Exception('Could not determine the constructor for mapping from JSON');
  }
}

@freezed
class NrdbDeck with _$NrdbDeck {
  const factory NrdbDeck({
    @JsonKey(fromJson: NrdbDeck.idFromJson) required String id,
    required String name,
    required String description,
    required String? mwlCode,
    required DateTime dateCreation,
    required DateTime dateUpdate,
    required Map<String, int> cards,
    @JsonKey(fromJson: NrdbDeck.tagsFromJson, toJson: NrdbDeck.tagsToJson) required List<String> tags,
  }) = _NrdbDeck;

  factory NrdbDeck.fromJson(Map<String, dynamic> json) => _$NrdbDeckFromJson(json);

  static idFromJson(dynamic id) => id.toString();
  static tagsFromJson(String? tags) => tags?.split(' ').where((e) => e.isNotEmpty).toList() ?? [];
  static tagsToJson(List<String> tags) => tags.isNotEmpty ? tags.join(' ') : null;
}

@freezed
class NrdbUser with _$NrdbUser {
  const factory NrdbUser(
    int id,
    String username,
    String email,
    int reputation,
    bool sharing,
  ) = _NrdbUser;

  factory NrdbUser.fromJson(Map<String, dynamic> json) => _$NrdbUserFromJson(json);
}
