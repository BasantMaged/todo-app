import 'package:equatable/equatable.dart';
import '../data/model/welcome_model.dart';

abstract class WelcomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class WelcomeInitial extends WelcomeState {}

class WelcomeLoading extends WelcomeState {}

class WelcomeSuccess extends WelcomeState {
  final WelcomeModel welcomeModel;

  WelcomeSuccess(this.welcomeModel);

  @override
  List<Object> get props => [welcomeModel];
}

class WelcomeFailure extends WelcomeState {
  final String error;

  WelcomeFailure(this.error);

  @override
  List<Object> get props => [error];
}
