import 'package:flutter/material.dart';
import 'package:flutter_playground/utils/app_routes.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  static final int SPLASH_SECONDS = 2;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: SPLASH_SECONDS), nextPage);
  }

  void nextPage() {
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.HOME, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'lib/assets/images/masterclass_logo.png',
        height: 50,
      ),
    );
  }
}
