import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/models/inventory.dart';
import 'package:taks_daily_app/src/repositories/database_repository.dart';

@lazySingleton
class GetInventory {
  GetInventory(this.repository);
  final DatabaseRepository repository;

  Future<Either<Exception, List<Inventory>>> execute() {
    return repository.getInventory();
  }
}
