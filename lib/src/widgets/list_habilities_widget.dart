import 'package:flutter/material.dart';
import 'package:flutter_playground/src/models/me_model.dart';

class ListHabilitiesWidget extends StatelessWidget {
  const ListHabilitiesWidget({
    Key? key,
    required this.meData,
  }) : super(key: key);

  final MeModel meData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: meData.habilities.length,
        itemBuilder: (ctx, index) {
          return Container(
            width: 70,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).cardTheme.color,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(size: 40),
                const SizedBox(height: 5),
                Text(
                  meData.habilities.keys.elementAt(index),
                  style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 8.5),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
