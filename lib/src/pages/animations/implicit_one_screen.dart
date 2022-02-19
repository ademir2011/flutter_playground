import 'package:flutter/material.dart';

class ImplicitOneScreen extends StatefulWidget {
  const ImplicitOneScreen({Key? key}) : super(key: key);

  @override
  _ImplicitOneScreenState createState() => _ImplicitOneScreenState();
}

class _ImplicitOneScreenState extends State<ImplicitOneScreen> {
  var isTap = false;
  final duration = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio do Botão Flutuante'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isTap = !isTap;
          });
        },
        child: AnimatedAlign(
          duration: Duration(seconds: duration),
          alignment: isTap ? Alignment.bottomRight : Alignment.topCenter,
          child: AnimatedContainer(
            duration: Duration(seconds: duration),
            margin: const EdgeInsets.all(20),
            width: isTap ? 50 : 150,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: isTap ? BorderRadius.circular(50) : null,
            ),
          ),
        ),
      ),
    );
  }
}
