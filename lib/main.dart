import 'package:flutter/material.dart';
import 'package:flutter_playground/screens/money_screen.dart';
import 'package:flutter_playground/screens/tinder_screen.dart';

void main(List<String> args) => runApp(const MaterialApp(home: Menu()));

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const MainMoneyScreen(),
            ),
          ),
          child: const Text('exercício 1 - Tela app money'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const MainTinderScreen(),
            ),
          ),
          child: const Text('exercício 2 - Tela app Tinder'),
        ),
      ],
    );
  }
}
