import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/repositories/database_repository.dart';

@lazySingleton
class InsertInventory {
  InsertInventory(this.repository);
  final DatabaseRepository repository;

  Future<Either<Exception, int?>> execute(String name, String image) {
    return repository.insertInventory(name, image);
  }
}
