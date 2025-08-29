import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/models/task_model.dart';

part 'fetch_tasks_state.dart';

class FetchTasksCubit extends Cubit<FetchTasksState> {
  FetchTasksCubit() : super(FetchTasksInitial());
   fetchAllTasks(){

      var tasksBox = Hive.box<TaskModel>("tasks box");
     List<TaskModel> tasksList= tasksBox.values.toList();
      emit(FetchTasksSuccess(tasksList));
    
  }
}
