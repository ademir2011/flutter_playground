import 'package:flutter/material.dart';
import 'package:flutter_playground/src/pages/playground/mvw/src/pages/cpf_validator_page.dart';

class MainMVW extends StatefulWidget {
  const MainMVW({Key? key}) : super(key: key);

  @override
  _MainMVWState createState() => _MainMVWState();
}

class _MainMVWState extends State<MainMVW> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CpfValidatorPage(),
    );
  }
}
