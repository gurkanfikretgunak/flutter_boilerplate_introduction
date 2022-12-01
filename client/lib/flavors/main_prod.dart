import 'package:client/gen/assets.gen.dart';
import 'package:client/starter.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: Assets.env.envProd);
  Flavor.create(
    Environment.production,
    properties: {
      Keys.apiUrl: dotenv.env["BASE_URL"].toString(),
      Keys.apiKey: dotenv.env["API_KEY"].toString(),
      Keys.appTitle: dotenv.env["APP_TITLE"].toString(),
      logLevelKey: 5,
    },
  );

  setupApp();
}
