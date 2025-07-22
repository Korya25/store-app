import 'package:flutter/material.dart';
import 'package:store_app/core/network/connectivity_controller.dart';
import 'package:store_app/core/network/network_banner..dart';

class NetworkStatusWrapper extends StatelessWidget {
  final Widget child;

  const NetworkStatusWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
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

        return child;
      },
    );
  }
}
