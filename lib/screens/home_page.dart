import 'package:flutter/material.dart';
import 'package:flutter_playground/components/cbottom_navigation_bar.dart';
import 'package:flutter_playground/components/cheader.dart';
import 'package:flutter_playground/screens/about_me_page.dart';
import 'package:flutter_playground/screens/activities_page.dart';
import 'package:flutter_playground/screens/repositories_screen.dart';

class HomePage extends StatefulWidget {
  final Function() toogleTheme;
  const HomePage({Key? key, required this.toogleTheme}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controllerPageView = PageController(
    initialPage: 0,
  );

  var _selectedIndex = 0;

  final titles = [
    'Atividades',
    'Repositórios',
    'Sobre o dev',
  ];

  final pages = [
    ActivitiesPage(),
    const RepositoriesPage(),
    AboutMePage(),
  ];

  void onNavigationTap(int index) {
    _selectedIndex = index;
    setState(() {
      controllerPageView.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CHeader(toogleTheme: widget.toogleTheme, titles: titles, selectedIndex: _selectedIndex),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controllerPageView,
              children: pages,
            ),
          ),
          CBottomNavigationBar(onNavigationTap: onNavigationTap),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controllerPageView.dispose();
  }
}
