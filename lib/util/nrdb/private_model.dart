import 'package:freezed_annotation/freezed_annotation.dart';

part 'private_model.freezed.dart';
part 'private_model.g.dart';

@Freezed(genericArgumentFactories: true, fromJson: true)
class HttpResult<T> with _$HttpResult<T> {
  const factory HttpResult.success(
    String versionNumber,
    bool success,
    T data,
    int total,
  ) = SuccessHttpResult;

  const factory HttpResult.failed(
    String versionNumber,
    bool success,
    String msg,
  ) = FailedHttpResult;

  const factory HttpResult.notFound() = NotFoundHttpResult;

  const factory HttpResult.unknown() = UnknownHttpResult;

  factory HttpResult.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    final success = json['success'];
    if (success is bool) {
      if (success) {
        return SuccessHttpResult.fromJson(json, fromJsonT);
      } else {
        return FailedHttpResult.fromJson(json, fromJsonT);
      }
    }
    return const HttpResult.unknown();
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

  static String idFromJson(dynamic id) => id.toString();
  static List<String> tagsFromJson(String? tags) => tags?.split(' ').where((e) => e.isNotEmpty).toList() ?? [];
  static String? tagsToJson(List<String> tags) => tags.isNotEmpty ? tags.join(' ') : null;
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
