import 'package:flutter/material.dart';

class CHeader extends StatelessWidget {
  final bool isExercises;
  final Function(bool) toogleTheme;
  const CHeader({
    Key? key,
    this.isExercises = false,
    required this.toogleTheme,
    required this.titles,
    required int selectedIndex,
  })  : _selectedIndex = selectedIndex,
        super(key: key);

  final List<String> titles;
  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      padding: const EdgeInsets.all(10),
      height: 70,
      child: Row(
        children: [
          isExercises
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              : Image.asset('lib/assets/images/logo.png', height: 40),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titles[_selectedIndex],
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                'Flutterando Masterclass',
                style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 12),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Switch(
                activeColor: Theme.of(context).primaryColor,
                value: Theme.of(context).backgroundColor == const Color(0xFFD6DFE4) ? true : false,
                onChanged: toogleTheme,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
