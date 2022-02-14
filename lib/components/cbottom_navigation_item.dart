import 'package:flutter/material.dart';

class CBottomNavigationItem extends StatelessWidget {
  final String title;
  final int index;
  final Function(int) onNavigationTap;
  const CBottomNavigationItem({
    Key? key,
    required this.title,
    required this.index,
    required this.onNavigationTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onNavigationTap(index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            const SizedBox(height: 1),
            Text(
              title,
              style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 9),
            ),
          ],
        ),
      ),
    );
  }
}
