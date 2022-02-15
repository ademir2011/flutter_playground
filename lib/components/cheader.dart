import 'package:flutter/material.dart';
import 'package:flutter_playground/helpers/icon_helper.dart';

class CHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool isExercises;
  final Function() toogleTheme;

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
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
        padding: const EdgeInsets.all(10),
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
                : Image.asset(IconHelper.getPath(IconName.logo), height: 40),
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
                child: IconButton(
                  icon: ImageIcon(
                    Theme.of(context).backgroundColor == const Color(0xFFD6DFE4)
                        ? AssetImage(IconHelper.getPath(IconName.moonDark))
                        : AssetImage(IconHelper.getPath(IconName.moonLight)),
                    size: 25,
                    color: Theme.of(context).primaryIconTheme.color,
                  ),
                  onPressed: toogleTheme,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(75);
}
