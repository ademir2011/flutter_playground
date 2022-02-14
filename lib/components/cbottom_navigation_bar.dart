import 'package:flutter/material.dart';

class CBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onNavigationTap;
  const CBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onNavigationTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(Icons.person),
              Text('asd'),
            ],
          ),
          const VerticalDivider(color: Colors.white, indent: 6, endIndent: 6),
          Column(
            children: [
              Icon(Icons.person),
              Text('asd'),
            ],
          ),
          const VerticalDivider(color: Colors.white, indent: 6, endIndent: 6),
          Column(
            children: [
              Icon(Icons.person),
              Text('asd'),
            ],
          ),
        ],
      ),
    );

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).backgroundColor,
      items: [
        const BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('lib/assets/images/icons/Icon feather-target.png'),
            size: 15,
          ),
          label: 'Atividades',
        ),
        const BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('lib/assets/images/icons/Icon awesome-github.png'),
            size: 15,
          ),
          label: 'Repositórios',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 19,
            color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          ),
          label: 'Sobre o dev',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onNavigationTap,
    );
  }
}
