part of 'fetch_tasks_cubit.dart';

@immutable
sealed class FetchTasksState {}

final class FetchTasksInitial extends FetchTasksState {}
final class FetchTasksSuccess extends FetchTasksState {
    final List<TaskModel> tasksList;
  FetchTasksSuccess(this.tasksList);
}
