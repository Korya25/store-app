import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvTypeEnum { dev, prod }

class EnvVarible {
  EnvVarible._();

  static final EnvVarible instance = EnvVarible._();

  String _envType = '';

  Future<void> init({required EnvTypeEnum envType}) async {
    switch (envType) {
      case EnvTypeEnum.dev:
        await dotenv.load(fileName: ".env.dev");
        break;
      case EnvTypeEnum.prod:
        await dotenv.load(fileName: ".env.prod");
        break;
    }

    _envType = dotenv.get("ENV_TYPE");
  }

  bool get debugMode => _envType == 'dev';
}
