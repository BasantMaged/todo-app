import 'package:dartz/dartz.dart';
import 'package:update_to_do_app/features/auth/data/model/user_model.dart';

class AuthRepository {
  Future<Either<String, UserModel>> register(
    String username,
    String password,
  ) async {
    try {
      // Simulate API call
      await Future.delayed(Duration(seconds: 2));
      return Right(UserModel(username: username, password: password));
    } catch (e) {
      return Left('Registration failed. Please try again.');
    }
  }

  Future<Either<String, UserModel>> login(
    String username,
    String password,
  ) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      if (username == "user" && password == "1234") {
        return Right(UserModel(username: username, password: password));
      } else {
        return Left('Invalid username or password');
      }
    } catch (e) {
      return Left('Login failed. Please try again.');
    }
  }
}
