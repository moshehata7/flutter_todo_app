import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/models/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());
  Future<void> addTask(TaskModel task) async {
    emit(AddTaskLoading());
    try {
      var taskBox = Hive.box<TaskModel>("task box");
      await taskBox.add(task);
      emit(AddTaskSuccess());
    } catch (e) {
      emit(AddTaskFailure(e.toString()));
    }
  }
}
