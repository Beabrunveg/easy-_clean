import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/repositories/database_repository.dart';

@lazySingleton
class GetTasksForDay {
  GetTasksForDay(this.repository);
  final DatabaseRepository repository;

  Future<Either<Exception, List<DailyTask>>> execute(String date) {
    return repository.getTasksForDay(date);
  }
}
