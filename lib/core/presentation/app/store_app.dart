import 'package:flutter/material.dart';
import 'package:store_app/core/network/connectivity_controller.dart';
import 'package:store_app/core/network/network_banner..dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store App',
      home: Builder(
        builder: (context) {
          return ValueListenableBuilder<bool>(
            valueListenable: ConnectivityController.instance.isConnected,
            builder: (context, isConnected, _) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                NetworkBanner.show(
                  context,
                  isConnected
                      ? NetworkStatusType.connected
                      : NetworkStatusType.disconnected,
                );
              });

              return Scaffold(
                appBar: AppBar(title: const Text('Store App')),
                body: Center(
                  child: Text(
                    isConnected ? '✅ You are online' : '❌ You are offline',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
