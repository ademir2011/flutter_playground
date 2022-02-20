import 'package:flutter/material.dart';

class GenericBorderWidget extends StatelessWidget {
  final Widget child;
  final bool isOff;
  const GenericBorderWidget({
    Key? key,
    this.isOff = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xffFDC2FF).withAlpha(isOff ? 25 : 75),
            blurRadius: 2,
            spreadRadius: 2.5,
          ),
          BoxShadow(
            color: const Color(0xffFDC2FF).withAlpha(isOff ? 5 : 15),
            blurRadius: 3,
            spreadRadius: 10,
          ),
          BoxShadow(
            color: const Color(0xffFDC2FF).withAlpha(75),
          ),
          const BoxShadow(
            color: Color(0xff1A1125),
            blurRadius: 4,
            spreadRadius: -4,
          ),
        ],
        border: Border.all(
          width: 1.5,
          color: const Color(0xffFDC2FF).withAlpha(isOff ? 0 : 255),
        ),
      ),
      child: child,
    );
  }
}
