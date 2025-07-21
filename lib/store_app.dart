import 'package:flutter/material.dart';
import 'package:store_app/core/app/env_varible.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: EnvVarible.instance.debugMode,
      title: 'Store App',
      home: Scaffold(
        appBar: AppBar(title: Text('Store App')),

        body: Center(child: Text('Store App')),
      ),
    );
  }
}
