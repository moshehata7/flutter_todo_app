import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String note;
  @HiveField(2)
   String date;
  @HiveField(3)
   String time;

  TaskModel({required this.time, required this.title, required this.note, required this.date});
}
