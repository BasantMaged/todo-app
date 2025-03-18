import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:update_to_do_app/core/local/local_data.dart';
import 'package:update_to_do_app/core/utils/app_assets.dart';
import 'package:update_to_do_app/features/add_tasks/view/add_task_view.dart';
import 'package:update_to_do_app/features/profile/view/profile_view.dart';
import 'package:update_to_do_app/features/add_tasks/manager/task_cubit.dart';
import 'package:update_to_do_app/features/add_tasks/manager/task_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required String userName});

  @override
  Widget build(BuildContext context) {
    String userName = LocalData.userName ?? "Guest";

    // Fetch tasks when HomeView opens
    context.read<TaskCubit>().fetchTasks();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          ListTile(
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(AppAssets.flagIcon),
              ),
            ),
            title: const Text("Hello!", style: TextStyle(fontSize: 18)),
            subtitle: Text(userName, style: const TextStyle(fontSize: 16)),
            trailing: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddTaskScreen(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.add, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Expanded(
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                if (state is TaskLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TaskSuccess) {
                  if (state.tasks.isEmpty) {
                    // Show Empty State Design
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "There are no tasks yet,\nPress the button\nTo add New Task",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        const SizedBox(height: 40),
                        SvgPicture.asset(AppAssets.emptyHome, height: 200),
                      ],
                    );
                  }
                  // Show Task List
                  return ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      final task = state.tasks[index];
                      return Card(
                        color: const Color(0xFFCEEBDC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          title: Text(task.title),

                          subtitle: Text(task.description),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.grey),
                            onPressed: () {
                              context.read<TaskCubit>().deleteTask(task.id);
                            },
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is TaskError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                return const Center(child: Text("No tasks available."));
              },
            ),
          ),
        ],
      ),
    );
  }
}
