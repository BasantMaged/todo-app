import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:update_to_do_app/core/network/dio_helper.dart';
import 'package:update_to_do_app/features/auth/manager/auth_cubit.dart';
import 'package:update_to_do_app/features/add_tasks/manager/task_cubit.dart';
import 'package:update_to_do_app/features/add_tasks/data/repo/task_repo.dart';
import 'package:update_to_do_app/features/welcome/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<TaskCubit>(
          create:
              (context) =>
                  TaskCubit(taskRepository: TaskRepository(APIHelper())),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Update To-Do App',
        home: SplashScreen(),
        theme: ThemeData(fontFamily: 'LexendDeca'),
      ),
    );
  }
}
