import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sinau_studio/views/splash_view.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // TODO Access Permission
  // await Permission.camera.request();
  // await Permission.mediaLibrary.request();
  // await Permission.photos.request();
  // await Permission.storage.request();
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
