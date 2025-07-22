// lib/store_app.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/network/network_status_wrapper.dart';
import 'package:store_app/core/resources/app_router.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) => MaterialApp.router(
        title: 'Store App',

        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        builder: (context, child) {
          return NetworkStatusWrapper(child: child ?? const SizedBox.shrink());
        },
      ),
    );
  }
}
