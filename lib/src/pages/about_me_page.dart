import 'package:flutter/material.dart';
import 'package:flutter_playground/helpers/icon_helper.dart';
import 'package:flutter_playground/src/models/me_model.dart';
import 'package:flutter_playground/src/widgets/card_habilities_widget.dart';
import 'package:flutter_playground/src/widgets/card_me_widget.dart';
import 'package:flutter_playground/src/widgets/list_habilities_widget.dart';

class AboutMePage extends StatelessWidget {
  AboutMePage({Key? key}) : super(key: key);

  final meData = MeModel(
      name: 'Mandaloriano',
      description:
          'Caçador de recompensas. Lutador de batalhas vorazes, destruidor de dragões, sou aquele que não adere a doutrina, portador de sabre Jedi porém não sou um. Sou apenas, o Mandaloriano.',
      urlImage:
          'https://elcomercio.pe/resizer/Obx0vdcoSA7set1nMFyrCK9sPlM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/CBWHFPLK3BFC5LGCBG44U7JNZM.jpg',
      habilities: {
        'Flutter': 0.1,
        'Java': 0.1,
        'Dart': 0.5,
        'C++': 0.7,
        'Excel': 0.9,
      },
      socialNetworksUrl: [
        IconHelper.getPath(IconName.whatsapp),
        IconHelper.getPath(IconName.githubAlt),
        IconHelper.getPath(IconName.instagram),
        IconHelper.getPath(IconName.facebook),
      ]);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardMeWidget(meData: meData),
            const SizedBox(height: 10),
            Text(
              'Tecnologias Favoritas',
              style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 12),
            ),
            ListHabilitiesWidget(meData: meData),
            const SizedBox(height: 10),
            Text(
              'Habilidades e Competências',
              style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 12),
            ),
            const SizedBox(height: 5),
            CardHabilitiesWidget(meData: meData),
          ],
        ),
      ),
    );
  }
}
