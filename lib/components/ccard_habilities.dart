import 'package:flutter/material.dart';
import 'package:flutter_playground/models/me.dart';

class CCardHabilities extends StatelessWidget {
  const CCardHabilities({
    Key? key,
    required this.meData,
  }) : super(key: key);

  final Me meData;

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
