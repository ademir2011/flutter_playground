import 'package:flutter_playground/enums/activity_type_enum.dart';
import 'package:flutter_playground/src/models/exercise_model.dart';

class ActivityModel {
  final ActivityTypeEnum type;
  final String description;
  final List<ExerciseModel> exercises;
  final String gitUrl;

  ActivityModel({
    required this.type,
    required this.description,
    required this.gitUrl,
    this.exercises = const [],
  });
}
