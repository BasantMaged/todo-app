import 'package:update_to_do_app/features/add_tasks/data/model/task_model.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskSuccess extends TaskState {
  final List<TaskModel> tasks;
  TaskSuccess(this.tasks);
}

class TaskError extends TaskState {
  final String message;
  TaskError(this.message);
}

class TaskAdded extends TaskState {
  final TaskModel task;
  TaskAdded(this.task);
}

class TaskUpdated extends TaskState {
  final TaskModel task;
  TaskUpdated(this.task);
}

class TaskDeleted extends TaskState {
  final int taskId;
  TaskDeleted(this.taskId);
}
