import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinau_studio/views/auth/login_view.dart';
import 'package:sinau_studio/views/main_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    initialization(context);
    // startSplashScreen();
  }

  Future initialization(BuildContext? context) async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.24,
                height: MediaQuery.of(context).size.height * 0.24,
                child: Image.asset('assets/logo_splash.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  startSplashScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginView(),
      ),
    );
    checkLogin();
  }

  void checkLogin() async {
    final helper = await SharedPreferences.getInstance();
    final token = helper.getString('token');
    if (token != null) {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MainView(),
          ),
          (route) => false,
        );
      }
    }
    return null;
  }
}
