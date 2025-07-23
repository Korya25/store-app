import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/network/network_status_wrapper.dart';
import 'package:store_app/core/resources/app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.homePath,
    routes: [
      GoRoute(
        name: AppRoutes.home,
        path: AppRoutes.homePath,
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.blue[50],
          appBar: AppBar(title: const Text('Home')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('🏠 Home Screen', style: TextStyle(fontSize: 24)),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => context.pushNamed(AppRoutes.product),
                  child: const Text('Go to Product'),
                ),
              ],
            ),
          ),
        ),
      ),
      GoRoute(
        name: AppRoutes.product,
        path: AppRoutes.productPath,
        builder: (context, state) => NetworkStatusWrapper(
          child: Scaffold(
            backgroundColor: Colors.green[50],
            appBar: AppBar(title: const Text('Product')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '📦 Product Screen',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => context.pushNamed(AppRoutes.settings),
                    child: const Text('Go to Settings'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      GoRoute(
        name: AppRoutes.settings,
        path: AppRoutes.settingsPath,
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.purple[50],
          appBar: AppBar(title: const Text('Settings')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '⚙️ Settings Screen',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text('Back'),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
