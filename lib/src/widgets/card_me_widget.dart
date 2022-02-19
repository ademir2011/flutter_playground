import 'package:flutter/material.dart';
import 'package:flutter_playground/src/models/me_model.dart';

class CardMeWidget extends StatelessWidget {
  const CardMeWidget({
    Key? key,
    required this.meData,
  }) : super(key: key);

  final MeModel meData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).cardTheme.color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              meData.urlImage,
              height: 75,
              width: 75,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            meData.name,
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 10),
          Text(
            meData.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ImageIcon(
                    AssetImage(meData.socialNetworksUrl[index]),
                    color: Theme.of(context).primaryIconTheme.color,
                    size: 22.5,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
