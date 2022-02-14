import 'package:flutter/material.dart';
import 'package:flutter_playground/components/cbottom_navigation_item.dart';

class CBottomNavigationBar extends StatelessWidget {
  final Function(int) onNavigationTap;
  CBottomNavigationBar({
    Key? key,
    required this.onNavigationTap,
  }) : super(key: key);

  final bottomMenuData = [
    {'icon': 'lib/assets/images/icons/Icon feather-target.png', 'text': 'Atividades'},
    {'icon': 'lib/assets/images/icons/Icon awesome-github.png', 'text': 'Repositórios'},
    {'icon': Icons.person, 'text': 'Sobre o dev'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        CBottomNavigationItem(
          title: bottomMenuData[0]['text'].toString(),
          index: 0,
          onNavigationTap: onNavigationTap,
        ),
        const VerticalDivider(color: Colors.white, indent: 6, endIndent: 6),
        CBottomNavigationItem(
          title: bottomMenuData[1]['text'].toString(),
          index: 1,
          onNavigationTap: onNavigationTap,
        ),
        const VerticalDivider(color: Colors.white, indent: 6, endIndent: 6),
        CBottomNavigationItem(
          title: bottomMenuData[2]['text'].toString(),
          index: 2,
          onNavigationTap: onNavigationTap,
        ),
      ]),
    );
  }
}
