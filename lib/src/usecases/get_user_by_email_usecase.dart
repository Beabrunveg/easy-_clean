import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/repositories/database_repository.dart';

@lazySingleton
class GetUserByEmail {
  GetUserByEmail(this.repository);
  final DatabaseRepository repository;

  Future<Either<Exception, User>> execute(String email) {
    return repository.getUserByEmail(email);
  }
}
