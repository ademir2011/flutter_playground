import 'package:flutter/material.dart';
import 'package:flutter_playground/components/cbottom_navigation_item.dart';
import 'package:flutter_playground/helpers/icon_helper.dart';

class CBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onNavigationTap;
  CBottomNavigationBar({
    Key? key,
    required this.onNavigationTap,
    required this.selectedIndex,
  }) : super(key: key);

  final bottomMenuData = [
    {'icon': IconHelper.getPath(IconName.target), 'text': 'Atividades'},
    {'icon': IconHelper.getPath(IconName.github), 'text': 'Repositórios'},
    {'icon': Icons.person, 'text': 'Sobre o dev'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CBottomNavigationItem(
            title: bottomMenuData[0]['text'].toString(),
            imageIcon: ImageIcon(
              AssetImage(bottomMenuData[0]['icon'].toString()),
              size: 22.5,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            index: 0,
            isSelected: selectedIndex == 0,
            onNavigationTap: onNavigationTap,
          ),
          VerticalDivider(color: Theme.of(context).dividerTheme.color, indent: 12.5, endIndent: 12.5),
          CBottomNavigationItem(
            title: bottomMenuData[1]['text'].toString(),
            imageIcon: ImageIcon(
              AssetImage(bottomMenuData[1]['icon'].toString()),
              size: 22.5,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            index: 1,
            isSelected: selectedIndex == 1,
            onNavigationTap: onNavigationTap,
          ),
          VerticalDivider(color: Theme.of(context).dividerTheme.color, indent: 12.5, endIndent: 12.5),
          CBottomNavigationItem(
            title: bottomMenuData[2]['text'].toString(),
            icon: Icon(
              Icons.person,
              color: Theme.of(context).primaryIconTheme.color,
              size: 27,
            ),
            index: 2,
            isSelected: selectedIndex == 2,
            onNavigationTap: onNavigationTap,
          ),
        ],
      ),
    );
  }
}
