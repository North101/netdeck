import 'package:envify/envify.dart';

part 'env.g.dart';

@Envify()
abstract class Env {
  static const nrdbClientId = _Env.nrdbClientId;
  static const nrdbClientSecret = _Env.nrdbClientSecret;
  static const nrdbRedirectUrl = _Env.nrdbRedirectUrl;
  static const nrdbAuthUrl = _Env.nrdbAuthUrl;
  static const nrdbTokenUrl = _Env.nrdbTokenUrl;
}