part of 'fetch_tasks_cubit.dart';

@immutable
@immutable
abstract class FetchTasksState {}

class FetchTasksInitial extends FetchTasksState {}

class FetchTasksSuccess extends FetchTasksState {
  final List<TaskModel> tasksList;
  final bool isCleared; 

  FetchTasksSuccess(this.tasksList, {this.isCleared = false});
}

