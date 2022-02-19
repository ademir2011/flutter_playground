import 'package:flutter/material.dart';
import 'package:flutter_playground/enums/activity_type_enum.dart';
import 'package:flutter_playground/helpers/activity_helper.dart';
import 'package:flutter_playground/helpers/icon_helper.dart';
import 'package:flutter_playground/src/models/activity_model.dart';
import 'package:flutter_playground/src/models/exercise_model.dart';
import 'package:flutter_playground/src/pages/animations/controller_one_screen.dart';
import 'package:flutter_playground/src/pages/animations/controller_second_screen.dart';
import 'package:flutter_playground/src/pages/animations/implicit_one_screen.dart';
import 'package:flutter_playground/src/pages/animations/implicit_second_screen.dart';
import 'package:flutter_playground/src/pages/mockups/money_screen.dart';
import 'package:flutter_playground/src/pages/mockups/tinder_screen.dart';
import 'package:flutter_playground/src/pages/playground/mvw/main_mvw.dart';
import 'package:flutter_playground/utils/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';

class ActivitiesPage extends StatelessWidget {
  ActivitiesPage({Key? key}) : super(key: key);

  final activities = [
    ActivityModel(
        type: ActivityTypeEnum.mockup,
        description: 'Clonagem de telas do Tinder e do app de Dinheiro',
        gitUrl: 'https://github.com/ademir2011/flutter_playground/tree/master/lib/screens/mockups',
        exercises: [
          ExerciseModel(title: 'Tinder', widget: const MainTinderScreen()),
          ExerciseModel(title: 'Mooney', widget: const MainMoneyScreen()),
        ]),
    ActivityModel(
      type: ActivityTypeEnum.animatios,
      description: 'Criação de animações implícitas e controladas',
      gitUrl: 'https://github.com/ademir2011/flutter_playground/tree/master/lib/screens/animations',
      exercises: [
        ExerciseModel(title: 'Animação Implícita 1', widget: const ImplicitOneScreen()),
        ExerciseModel(title: 'Animação Implícita 2', widget: const ImplicitSecondScreen()),
        ExerciseModel(title: 'Animação Controlada 1', widget: const ControllerOneScreeen()),
        ExerciseModel(title: 'Animação Controlada 2', widget: const ControllerSecondScreen()),
      ],
    ),
    ActivityModel(
      type: ActivityTypeEnum.playground,
      description: 'Criação do design patters mvw',
      gitUrl: '',
      exercises: [
        ExerciseModel(title: 'Animação Implícita 1', widget: const MainMVW()),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (ctx, index) {
        return Container(
          height: 175,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).cardTheme.color,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 17,
                    child: ImageIcon(
                      AssetImage(
                        getIconType(activities[index].type),
                      ),
                      color: Theme.of(context).iconTheme.color,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    ActivityHelper.getTitle(activities[index].type),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const Spacer(),
                  Text(
                    'Exercícios',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '${activities[index].exercises.length}',
                    style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 12),
                  )
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    activities[index].description,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Row(
                children: [
                  ImageIcon(
                    AssetImage(IconHelper.getPath(IconName.github)),
                    size: 15,
                    color: Theme.of(context).primaryIconTheme.color,
                  ),
                  TextButton(
                    onPressed: () async {
                      await launch(activities[index].gitUrl, forceWebView: true);
                    },
                    child: Text(
                      'Acessar código fonte',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Ver mais',
                        style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.EXERCISES,
                        arguments: activities[index].exercises,
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  String getIconType(ActivityTypeEnum type) {
    if (type == ActivityTypeEnum.animatios) {
      return IconHelper.getPath(IconName.running);
    } else if (type == ActivityTypeEnum.mockup) {
      return IconHelper.getPath(IconName.glasses);
    } else {
      return IconHelper.getPath(IconName.toys);
    }
  }
}
