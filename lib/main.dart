import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/core/app/env_varible.dart';
import 'package:store_app/core/network/connectivity_controller.dart';
import 'package:store_app/core/presentation/app/store_app.dart';

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

  runApp(const StoreApp());
}
