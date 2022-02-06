import 'package:flutter/material.dart';
import 'package:flutter_playground/screens/controller_one_screen.dart';
import 'package:flutter_playground/screens/controller_second_screen.dart';
import 'package:flutter_playground/screens/implicit_one_screen.dart';
import 'package:flutter_playground/screens/implicit_second_screen.dart';
import 'package:flutter_playground/screens/money_screen.dart';
import 'package:flutter_playground/screens/tinder_screen.dart';

void main(List<String> args) => runApp(const MaterialApp(home: Menu()));

final buttons = [
  {'title': 'exercício 1.1 - Tela app money', 'link': const MainMoneyScreen()},
  {'title': 'exercício 1.2 - Tela app Tinder', 'link': const MainTinderScreen()},
  {'title': 'exercício 2.1.1 - Anim. Implic', 'link': const ImplicitOneScreen()},
  {'title': 'exercício 2.1.2 - Anim. Implic', 'link': const ImplicitSecondScreen()},
  {'title': 'exercício 2.2.1 - Anim. Control', 'link': const ControllerOneScreeen()},
  {'title': 'exercício 2.2.2 - Anim. Control', 'link': const ControllerSecondScreen()},
];

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...buttons.map(
          (e) {
            return ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => (e['link'] as Widget),
                ),
              ),
              child: Text(e['title'].toString()),
            );
          },
        ).toList(),
      ],
    );
  }
}
