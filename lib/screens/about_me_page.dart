import 'package:flutter/material.dart';
import 'package:flutter_playground/components/ccard_habilities.dart';
import 'package:flutter_playground/components/ccard_me.dart';
import 'package:flutter_playground/components/clist_habilities.dart';
import 'package:flutter_playground/helpers/icon_helper.dart';
import 'package:flutter_playground/models/me.dart';

class AboutMePage extends StatelessWidget {
  AboutMePage({Key? key}) : super(key: key);

  final meData = Me(
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
            CCardMe(meData: meData),
            const SizedBox(height: 10),
            Text(
              'Tecnologias Favoritas',
              style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 12),
            ),
            CListHabilities(meData: meData),
            const SizedBox(height: 10),
            Text(
              'Habilidades e Competências',
              style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 12),
            ),
            const SizedBox(height: 5),
            CCardHabilities(meData: meData),
          ],
        ),
      ),
    );
  }
}
