import 'package:flutter/material.dart';

class ButtonChooseWidget extends StatelessWidget {
  final void Function() onPressed;
  const ButtonChooseWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xffFEEBFF),
          ),
        ),
      ),
    );
  }
}
