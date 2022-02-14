import 'dart:math';

import 'package:flutter/material.dart';

class ExtraMainScreen extends StatelessWidget {
  const ExtraMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExtraScreen(),
    );
  }
}

class ExtraScreen extends StatefulWidget {
  const ExtraScreen({Key? key}) : super(key: key);

  @override
  _ExtraScreenState createState() => _ExtraScreenState();
}

double sizeChar = 25;
int horizontalElements = 30;
int verticalElements = 12;
double valueTicker = 0.0;

late List<AnimationController> controllers;
late List<List<Animation<double?>>> listOpacityAnimations;
late List<List<Animation<Color?>>> listColorAnimations;

class _ExtraScreenState extends State<ExtraScreen> with TickerProviderStateMixin {
  var isTap = false;

  @override
  void initState() {
    super.initState();

    controllers = List.generate(verticalElements, (index) {
      return AnimationController(vsync: this, duration: const Duration(seconds: 5));
    });

    listOpacityAnimations = List.generate(verticalElements, (indexVerticalElements) {
      return List.generate(
        horizontalElements,
        (index) => Tween<double>(begin: 1, end: 0).animate(
          CurvedAnimation(
            parent: controllers[indexVerticalElements],
            curve: Interval((index + 1) / horizontalElements, 1),
          ),
        ),
      );
    });

    listColorAnimations = List.generate(verticalElements, (indexVerticalElements) {
      return List.generate(
        horizontalElements,
        (index) => ColorTween(begin: Colors.white, end: Color(0xFF009966)).animate(controllers[indexVerticalElements]),
      );
    });

    controllers.forEach((element) {
      Future.delayed(Duration(seconds: Random().nextInt(10)), () {
        element.repeat();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controllers.forEach((element) {
      element.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(
        children: List.generate(
          verticalElements,
          (index) => SizedBox(
            width: sizeChar * 1.3,
            child: AnimatedBuilder(
              animation: controllers[index],
              builder: (ctx, child) => Stack(
                children: createLetters(index),
              ),
            ),
          ),
        ),
      ),
      Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF009966), width: 3),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF009966),
                blurRadius: 100,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: const Text(
            'FLUTRIX',
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Color(0xFF009966),
              shadows: [
                Shadow(
                  blurRadius: 10,
                  color: Colors.white,
                ),
                Shadow(
                  blurRadius: 30,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  List<Widget> createLetters(int indexVeritacal) {
    return List.generate(horizontalElements, (index) {
      return Pimba(
        indexVeritacal: indexVeritacal,
        index: index,
        top: (index + 1) * sizeChar,
      );
    });
  }
}

class Pimba extends StatefulWidget {
  final double top;
  final int indexVeritacal;
  final int index;
  const Pimba({Key? key, this.top = 0, required this.index, required this.indexVeritacal}) : super(key: key);

  @override
  _PimbaState createState() => _PimbaState();
}

class _PimbaState extends State<Pimba> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      child: Opacity(
        opacity: listOpacityAnimations[widget.indexVeritacal][widget.index].value! == 1
            ? 0
            : listOpacityAnimations[widget.indexVeritacal][widget.index].value!,
        child: CodeText(indexVeritacal: widget.indexVeritacal, index: widget.index),
      ),
    );
  }
}

class CodeText extends StatefulWidget {
  final int indexVeritacal;
  final int index;

  const CodeText({Key? key, required this.index, required this.indexVeritacal}) : super(key: key);

  @override
  _CodeTextState createState() => _CodeTextState();
}

class _CodeTextState extends State<CodeText> {
  late final int valueSubString;
  late final String character;

  @override
  void initState() {
    valueSubString = Random().nextInt(24);
    character = 'abcdefghijklmnopqrstuvwxyz'.substring(valueSubString, valueSubString + 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizeChar * 2,
      height: sizeChar,
      child: FittedBox(
        child: Text(
          character,
          style: TextStyle(
              fontFamily: 'MandoAfClassic',
              color: listColorAnimations[widget.indexVeritacal][widget.index].value,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w100,
              shadows: const [
                Shadow(
                  color: Color(0xFF009966),
                  blurRadius: 40,
                  offset: Offset(0, 0),
                ),
                Shadow(
                  color: Colors.white,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ]),
        ),
      ),
    );
  }
}
