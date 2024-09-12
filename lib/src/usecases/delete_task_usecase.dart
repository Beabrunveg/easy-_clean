import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/repositories/database_repository.dart';

@lazySingleton
class DeleteTask {
  DeleteTask(this.repository);
  final DatabaseRepository repository;

  Future<Either<Exception, void>> execute(int id) {
    return repository.deleteTask(id);
  }
}
