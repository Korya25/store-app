import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/di/injuction.dart';
import 'package:store_app/core/serivces/shared_pref/shared_pref.dart';
import 'package:store_app/core/utils/bloc_observer.dart';
import 'package:store_app/core/utils/env_varible.dart';
import 'package:store_app/core/serivces/network/connectivity_controller.dart';
import 'package:store_app/store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVarible.instance.init(envType: EnvTypeEnum.prod);
  await ConnectivityController.instance.init();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: "AIzaSyDaIQf_o_bTcbq8bKyPfoUK3qa47YIoB-Q",
            appId: "1:903572566155:android:58638c1a4c20f0eb8c248e",
            messagingSenderId: "903572566155",
            projectId: "store-app-f5ad7",
          ),
        )
      : await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SharedPref().instantiatePreferences();
  await setupInjector();
  Bloc.observer = AppBlocObserver();
  runApp(
    /*
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const StoreApp(),
      koryaadmin@gmail.com
      1234
    ),l
    */
    const StoreApp(),
  );
}
