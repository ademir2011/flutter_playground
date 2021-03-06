import 'package:flutter/material.dart';
import 'package:flutter_playground/src/models/exercise_model.dart';
import 'package:flutter_playground/src/widgets/header_widget.dart';

class ExercisesPage extends StatelessWidget {
  final Function() toogleTheme;
  const ExercisesPage({Key? key, required this.toogleTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final exercises = ModalRoute.of(context)!.settings.arguments as List<ExerciseModel>;

    return Scaffold(
      appBar: HeaderWidget(
        toogleTheme: toogleTheme,
        isExercises: true,
        selectedIndex: 0,
        titles: const ['Atividades'],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => exercises[index].widget),
                    );
                  },
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: const EdgeInsets.all(7.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).cardTheme.color,
                    ),
                    child: Row(children: [
                      CircleAvatar(
                        child: Text(
                          '${index + 1}',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      const Spacer(),
                      Text(
                        'Exercício ${index + 1}',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
