import 'package:dotenv_gen/dotenv_gen.dart';

part 'env.g.dart';

@DotEnvGen()
abstract class Env {
  String get nrdbClientId;
  String get nrdbClientSecret;
  String get nrdbRedirectUrl;
  String get nrdbAuthUrl;
  String get nrdbTokenUrl;
}
