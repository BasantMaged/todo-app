import 'package:dartz/dartz.dart';
import '../model/welcome_model.dart';

class WelcomeRepository {
  Future<Either<String, WelcomeModel>> fetchWelcomeData() async {
    try {
      await Future.delayed(const Duration(seconds: 2)); // Simulating a delay
      return Right(WelcomeModel(message: "Welcome to TODO App!"));
    } catch (e) {
      return Left("Failed to fetch welcome data: ${e.toString()}");
    }
  }
}
