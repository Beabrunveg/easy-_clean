import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/repositories/database_repository.dart';

@lazySingleton
class GetListDaysPast {
  GetListDaysPast(this.repository);
  final DatabaseRepository repository;

  Future<Either<Exception, List<Daily>>> execute() {
    return repository.getDailyPast();
  }
}
