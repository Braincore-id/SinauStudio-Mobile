import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sinau_studio/views/splash/splash_view.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        // colorSchemeSeed: Colors.cyan,
        useMaterial3: true,
        // primarySwatch: Colors.cyan,
      ),
      home: const SplashView(),
    );
  }
}
