import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:update_to_do_app/core/localization/localization_service.dart';
import 'package:update_to_do_app/core/localization/translations.dart';
import 'package:update_to_do_app/core/network/dio_helper.dart';
import 'package:update_to_do_app/features/auth/manager/auth_cubit.dart';
import 'package:update_to_do_app/features/add_tasks/manager/task_cubit.dart';
import 'package:update_to_do_app/features/add_tasks/data/repo/task_repo.dart';
import 'package:update_to_do_app/features/profile/data/repo/change_password_repo.dart';
import 'package:update_to_do_app/features/profile/data/repo/profile_repo.dart';
import 'package:update_to_do_app/features/profile/manager/cubit/change_password_cubit.dart';
import 'package:update_to_do_app/features/profile/manager/cubit/profile_cubit.dart';
import 'package:update_to_do_app/features/welcome/view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalizationService localizationService = Get.put(LocalizationService());
  await localizationService.loadLanguage(); // Load saved language
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
        BlocProvider(
          create:
              (context) => ProfileCubit(
                repository: ProfileRepository(
                  APIHelper(),
                  apiHelper: APIHelper(),
                ),
              ),
        ),
        BlocProvider(
          create:
              (context) => ChangePasswordCubit(
                repository:
                    ChangePasswordRepository(), // ✅ Required argument provided
              ),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Update To-Do App',
        locale: Get.deviceLocale,
        fallbackLocale: const Locale('en'),
        translations: AppTranslations(),
        home: SplashScreen(),
        theme: ThemeData(fontFamily: 'LexendDeca'),
      ),
    );
  }
}
