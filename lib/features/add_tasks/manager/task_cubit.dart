import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:update_to_do_app/features/add_tasks/data/model/task_model.dart';
import 'package:update_to_do_app/features/add_tasks/data/repo/task_repo.dart';
import 'package:update_to_do_app/features/add_tasks/manager/task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository taskRepository;

  TaskCubit({required this.taskRepository}) : super(TaskInitial());

  void fetchTasks() async {
    emit(TaskLoading());
    try {
      final tasks = await taskRepository.fetchTasks();
      emit(TaskSuccess(tasks));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void addTask(TaskModel task) async {
    emit(TaskLoading()); //  Show loading before request
    try {
      final newTask = await taskRepository.addTask(task);
      emit(TaskAdded(newTask)); //  Success state
      fetchTasks(); //  Refresh tasks after adding
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void deleteTask(int taskId) async {
    emit(TaskLoading()); //  Show loading before request
    try {
      await taskRepository.deleteTask(taskId);
      emit(TaskDeleted(taskId)); //  Success state
      fetchTasks();
      emit(TaskLoading()); //  Refresh tasks after deletion
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void updateTask(TaskModel task) async {
    emit(TaskLoading()); //  Show loading before request
    try {
      final updatedTask = await taskRepository.updateTask(task);
      emit(TaskUpdated(updatedTask)); //  Success state
      fetchTasks(); //  Refresh tasks after update
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }
}
