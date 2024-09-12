import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/models/daily_task.dart';
import 'package:taks_daily_app/src/repositories/database_repository.dart';

@lazySingleton
class UpdateTask {
  UpdateTask(this.repository);
  final DatabaseRepository repository;

  Future<Either<Exception, void>> execute(DailyTask task) {
    return repository.updateTask(task);
  }
}
