import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/models/task_model.dart';

part 'fetch_tasks_state.dart';

class FetchTasksCubit extends Cubit<FetchTasksState> {
  FetchTasksCubit() : super(FetchTasksInitial());
  List<TaskModel> tasksList = [];
  fetchAllTasks() {
    var tasksBox = Hive.box<TaskModel>("tasks box");
    tasksList = tasksBox.values.toList();
    emit(FetchTasksSuccess(tasksList,isCleared: false));
  }

  deleteAllTasks() {
    var tasksBox = Hive.box<TaskModel>("tasks box");
  tasksBox.clear();
   tasksList.clear();  
    emit(FetchTasksSuccess(tasksList,isCleared: true));
  }
}
