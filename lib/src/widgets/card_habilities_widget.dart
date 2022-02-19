import 'package:flutter/material.dart';
import 'package:flutter_playground/src/models/me_model.dart';

class CardHabilitiesWidget extends StatelessWidget {
  const CardHabilitiesWidget({
    Key? key,
    required this.meData,
  }) : super(key: key);

  final MeModel meData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).cardTheme.color,
      ),
      child: ListView.builder(
        itemCount: meData.habilities.length,
        itemBuilder: (ctx, index) {
          return SizedBox(
            height: 30,
            child: Row(
              children: [
                SizedBox(
                  width: 75,
                  child: Text(
                    meData.habilities.keys.elementAt(index),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: 7.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                      Container(
                        height: 7.5,
                        width: 165 * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
