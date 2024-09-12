import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/models/inventory.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/services/database_service.dart';

abstract class DatabaseRepository {
  Future<Either<Exception, User>> getUserByEmail(String email);
  Future<Either<Exception, void>> insertUser(User user);
  Future<Either<Exception, void>> insertDaily(Daily daily);
  Future<Either<Exception, void>> updateUser(User user);
  Future<Either<Exception, int?>> insertTask(DailyTask task);
  Future<Either<Exception, List<DailyTask>>> getTasksForDay(String date);
  Future<Either<Exception, void>> updateTaskCompletion(
    int id,
    bool isCompleted,
    String image,
  );
  Future<Either<Exception, void>> updateTask(DailyTask task);
  Future<Either<Exception, void>> deleteTask(int id);
  Future<Either<Exception, WeeklySummary>> getWeeklyTaskCount(
    DateTime startDate,
    DateTime endDate,
  );
  Future<Either<Exception, List<Daily>>> getDailyPast();
  Future<Either<Exception, int>> insertInventory(String name, String image);
  Future<Either<Exception, void>> deleteInventory(int id);
  Future<Either<Exception, List<Inventory>>> getInventory();
}

@LazySingleton(as: DatabaseRepository)
class DatabaseRepositoryImpl implements DatabaseRepository {
  DatabaseRepositoryImpl(this._databaseService);
  final DatabaseService _databaseService;

  @override
  Future<Either<Exception, User>> getUserByEmail(String email) async {
    try {
      final user = await _databaseService.getUserByEmail(email);
      if (user == null) {
        return Left(Exception('User not found'));
      }
      return Right(user);
    } catch (e) {
      return Left(Exception('Failed to get user: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> updateUser(User user) async {
    try {
      await _databaseService.updateUser(user.id, user);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to update user: $e'));
    }
  }

  @override
  Future<Either<Exception, int?>> insertTask(DailyTask task) async {
    try {
      final id = await _databaseService.insertTask(task);
      return Right(id);
    } catch (e) {
      return Left(Exception('Failed to insert task: $e'));
    }
  }

  @override
  Future<Either<Exception, List<DailyTask>>> getTasksForDay(
    String date,
  ) async {
    try {
      final tasks = await _databaseService.getTasksForDay(date);
      return Right(tasks);
    } catch (e) {
      return Left(Exception('Failed to get tasks for day: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> updateTaskCompletion(
    int id,
    bool isCompleted,
    String image,
  ) async {
    try {
      await _databaseService.updateTaskCompletion(id, isCompleted, image);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to update task completion: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> updateTask(DailyTask task) async {
    try {
      await _databaseService.updateTask(task);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to update task: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> deleteTask(int id) async {
    try {
      await _databaseService.deleteTask(id);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to delete task: $e'));
    }
  }

  @override
  Future<Either<Exception, WeeklySummary>> getWeeklyTaskCount(
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      final summary =
          await _databaseService.getWeeklyTaskCount(startDate, endDate);
      return Right(summary);
    } catch (e) {
      return Left(Exception('Failed to get weekly task count: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> insertUser(User user) async {
    try {
      await _databaseService.insertUser(user);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to insert user: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> insertDaily(Daily daily) async {
    try {
      await _databaseService.insertDaily(daily);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to insert daily: $e'));
    }
  }

  @override
  Future<Either<Exception, List<Daily>>> getDailyPast() async {
    try {
      final dailies = await _databaseService.getDailyPast();
      return Right(dailies);
    } catch (e) {
      return Left(Exception('Failed to get daily past: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> deleteInventory(int id) async {
    try {
      await _databaseService.deleteInventory(id);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to delete inventory: $e'));
    }
  }

  @override
  Future<Either<Exception, List<Inventory>>> getInventory() async {
    try {
      final inventory = await _databaseService.getInventory();
      return Right(inventory);
    } catch (e) {
      return Left(Exception('Failed to get inventory: $e'));
    }
  }

  @override
  Future<Either<Exception, int>> insertInventory(
    String name,
    String image,
  ) async {
    try {
      final id = await _databaseService.insertInventory(name, image);
      return Right(id);
    } catch (e) {
      return Left(Exception('Failed to insert inventory: $e'));
    }
  }
}
