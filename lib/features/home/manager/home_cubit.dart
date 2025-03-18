import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:update_to_do_app/features/home/data/repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo = HomeRepo();
  String? username;

  void fetchUsername() async {
    emit(HomeLoadingState());

    var response = await homeRepo.getUsername();
    response.fold(
      (String error) {
        emit(HomeErrorState(error: error));
      },
      (String name) {
        username = name;
        emit(HomeLoadedState(username: name));
      },
    );
  }
}
