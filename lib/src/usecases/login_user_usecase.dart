import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/repositories/database_repository.dart';

@lazySingleton
class LoginUser {
  LoginUser(this.repository);
  final DatabaseRepository repository;

  Future<Either<Exception, User>> execute(String email, String password) async {
    final userResult = await repository.getUserByEmail(email);
    return userResult.fold(
      left,
      (r) {
        if (r.password == password) {
          return right(r);
        } else {
          return left(Exception('Invalid password'));
        }
      },
    );
  }
}
