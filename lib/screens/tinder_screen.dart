import 'package:flutter/material.dart';

class MainTinderScreen extends StatelessWidget {
  const MainTinderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TinderScreen(),
    );
  }
}

class TinderScreen extends StatelessWidget {
  const TinderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
