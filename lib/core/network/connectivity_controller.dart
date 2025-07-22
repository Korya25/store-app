import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:store_app/core/utils/app_logger.dart';

class ConnectivityController {
  ConnectivityController._();

  static final ConnectivityController instance = ConnectivityController._();

  final ValueNotifier<bool> isConnected = ValueNotifier(false);

  Future<void> init() async {
    AppLogger.info(
      '📡 [ConnectivityController] Starting connectivity initialization...',
    );

    final List<ConnectivityResult> results = await Connectivity()
        .checkConnectivity();

    final ConnectivityResult firstResult = results.isNotEmpty
        ? results.first
        : ConnectivityResult.none;

    AppLogger.info('🔍 Initial Connectivity Check: $firstResult');

    await _verifyInternet(firstResult);

    Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      final ConnectivityResult result = results.isNotEmpty
          ? results.first
          : ConnectivityResult.none;

      AppLogger.warn('🔄 Connectivity Changed: $result');

      _verifyInternet(result);
    });
  }

  Future<void> _verifyInternet(ConnectivityResult result) async {
    AppLogger.info('🌐 Verifying internet access for: $result...');

    final hasInternet = await InternetConnectionChecker.instance.hasConnection;

    if (hasInternet) {
      AppLogger.info('✅ Internet is available');
    } else {
      AppLogger.error('❌ No internet access');
    }

    isConnected.value = hasInternet;
  }
}
