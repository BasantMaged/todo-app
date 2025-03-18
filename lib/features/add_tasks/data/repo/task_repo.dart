import 'package:update_to_do_app/core/local/local_data.dart';
import 'package:update_to_do_app/core/network/dio_helper.dart';
import 'package:update_to_do_app/core/network/end_points.dart';
import 'package:update_to_do_app/features/add_tasks/data/model/task_model.dart';

class TaskRepository {
  final APIHelper apiHelper;

  TaskRepository(this.apiHelper);

  Future<List<TaskModel>> fetchTasks() async {
    try {
      final response = await apiHelper.getRequest(endPoint: EndPoints.getTasks);

      if (response.statusCode == 200 && response.data['status'] == true) {
        List tasks = response.data['tasks'];
        return tasks.map((task) => TaskModel.fromJson(task)).toList();
      } else {
        throw Exception("Failed to fetch tasks");
      }
    } catch (e) {
      throw Exception("Error fetching tasks: ${e.toString()}");
    }
  }

  Future<TaskModel> addTask(TaskModel task) async {
    try {
      final response = await apiHelper.postRequest(
        endPoint: EndPoints.newTask,
        data: task.toJson(),
      );

      if (response.statusCode == 201) {
        return TaskModel.fromJson(response.data);
      } else {
        throw Exception("Failed to add task");
      }
    } catch (e) {
      throw Exception("Error adding task: ${e.toString()}");
    }
  }

  Future<TaskModel> updateTask(TaskModel task) async {
    try {
      final response = await apiHelper.putRequest(
        endPoint: EndPoints.updateTask,
        data: task.toJson(),
      );

      if (response.statusCode == 200) {
        return TaskModel.fromJson(response.data);
      } else {
        throw Exception("Failed to update task");
      }
    } catch (e) {
      throw Exception("Error updating task: ${e.toString()}");
    }
  }

  Future<void> deleteTask(int taskId) async {
    print("Attempting to delete task with ID: $taskId");

    try {
      final response = await apiHelper.deleteRequest(
        endPoint: "${EndPoints.deleteTask}/$taskId", // tasks/2
        headers: {
          "Authorization":
              "Bearer ${LocalData.accessToken}", // Replace with actual token
        },
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to delete task");
      }
    } catch (e) {
      throw Exception("Error deleting task: ${e.toString()}");
    }
  }
}
