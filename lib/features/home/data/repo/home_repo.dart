import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

class HomeRepo {
  final Dio dio = Dio();

  Future<Either<String, String>> getUsername() async {
    try {
      Response response = await dio.get('https://api.example.com/user');
      if (response.statusCode == 200) {
        return Right(response.data['username']);
      } else {
        return Left('Failed to fetch username');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }
}
