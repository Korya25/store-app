import 'package:flutter/material.dart';
import 'package:store_app/core/serivces/network/connectivity_controller.dart';
import 'package:store_app/core/serivces/network/network_banner.dart';

class NetworkStatusWrapper extends StatefulWidget {
  final Widget child;

  const NetworkStatusWrapper({super.key, required this.child});

  @override
  State<NetworkStatusWrapper> createState() => _NetworkStatusWrapperState();
}

class _NetworkStatusWrapperState extends State<NetworkStatusWrapper> {
  bool _hasShownInitialBanner = false;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (innerContext) {
        return ValueListenableBuilder<bool>(
          valueListenable: ConnectivityController.instance.isConnected,
          builder: (context, isConnected, _) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              final type = isConnected
                  ? NetworkStatusType.connected
                  : NetworkStatusType.disconnected;

              if (!_hasShownInitialBanner) {
                if (!isConnected) {
                  NetworkBanner.show(innerContext, type);
                }
                _hasShownInitialBanner = true;
              } else {
                NetworkBanner.show(innerContext, type);
              }
            });

            return widget.child;
          },
        );
      },
    );
  }
}
