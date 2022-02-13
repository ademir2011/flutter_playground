import 'package:flutter_playground/enums/activity_type_enum.dart';
import 'package:flutter_playground/models/exercise.dart';

class Activity {
  final ActivityTypeEnum type;
  final String description;
  final List<Exercise> exercises;
  final String gitUrl;

  Activity({
    required this.type,
    required this.description,
    required this.gitUrl,
    this.exercises = const [],
  });
}
