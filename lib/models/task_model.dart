import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final String time;

  TaskModel({required this.time, required this.title, required this.subtitle, required this.date});
}
