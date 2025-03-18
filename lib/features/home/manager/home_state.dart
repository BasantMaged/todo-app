abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final String username;
  HomeLoadedState({required this.username});
}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState({required this.error});
}
