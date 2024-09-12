import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/db/db_config.dart';
import 'package:taks_daily_app/src/models/inventory.dart';
import 'package:taks_daily_app/src/models/models.dart';

abstract class DatabaseService {
  Future<void> updateUser(int id, User user);
  Future<void> insertUser(User user);
  Future<User?> getUserByEmail(String email);
  Future<int?> insertTask(DailyTask task);
  Future<void> insertDaily(Daily daily);
  Future<List<DailyTask>> getTasksForDay(String date);
  Future<void> updateTaskCompletion(int id, bool isCompleted, String image);
  Future<void> updateTask(DailyTask task);
  Future<void> deleteTask(int id);
  Future<WeeklySummary> getWeeklyTaskCount(
    DateTime startDate,
    DateTime endDate,
  );
  Future<List<Daily>> getDailyPast();

  Future<int> insertInventory(String name, String image);

  Future<void> deleteInventory(int id);

  Future<List<Inventory>> getInventory();
}

@LazySingleton(as: DatabaseService)
class DatabaseServiceImpl implements DatabaseService {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Future<void> updateUser(int id, User user) async {
    await _databaseHelper.updateUser(
      id,
      user.name,
      user.email,
      user.password,
      user.phone,
      user.image,
    );
  }

  @override
  Future<User?> getUserByEmail(String email) async {
    final userMap = await _databaseHelper.getUserByEmail(email);
    if (userMap == null) return null;
    return User.fromJson(userMap);
  }

  @override
  Future<int?> insertTask(DailyTask task) async {
    final id = await _databaseHelper.insertTask(
      task.taskName,
      task.taskDescription,
      task.date,
      task.color,
      task.image,
    );
    return id;
  }

  @override
  Future<List<DailyTask>> getTasksForDay(String date) async {
    final tasksMap = await _databaseHelper.getTasksForDay(
      date,
    );
    return tasksMap.map((taskMap) {
      return DailyTask(
        id: taskMap['id'] as int,
        taskName: taskMap['title'] as String,
        taskDescription: taskMap['description'] as String,
        date: date,
        isCompleted: (taskMap['isCompleted'] as int) == 1,
        color: taskMap['color'] as String,
        image: taskMap['image'] as String,
      );
    }).toList();
  }

  @override
  Future<void> updateTaskCompletion(
    int id,
    bool isCompleted,
    String image,
  ) async {
    await _databaseHelper.updateTaskCompletion(id, isCompleted, image);
  }

  @override
  Future<void> updateTask(DailyTask task) async {
    await _databaseHelper.updateTask(
      task.id,
      task.taskName,
      task.taskDescription,
    );
  }

  @override
  Future<void> deleteTask(int id) async {
    await _databaseHelper.deleteTask(id);
  }

  @override
  Future<WeeklySummary> getWeeklyTaskCount(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final startDayFormat = '${startDate.day}-${startDate.month}-'
        '${startDate.year}';
    final endDayFormat = '${endDate.day}-${endDate.month}-'
        '${endDate.year}';
    final tasksMap = await _databaseHelper.getWeeklyTaskCount(
      startDayFormat,
      endDayFormat,
    );

    final taskList = tasksMap.map((taskMap) {
      log('TaskMap: $taskMap');
      return DailyTask(
        id: taskMap['id'] as int,
        taskName: taskMap['title'] as String,
        taskDescription: taskMap['description'] as String,
        date: taskMap['date'] as String,
        isCompleted: (taskMap['isCompleted'] as int) == 1,
        color: taskMap['color'] as String,
        image: taskMap['image'] as String,
      );
    }).toList();

    final totalTasks =
        tasksMap.fold<int>(0, (sum, item) => sum + (item['taskCount'] as int));

    return WeeklySummary(
      startDate: startDate,
      endDate: endDate,
      totalTasks: totalTasks,
      tasks: taskList,
    );
  }

  @override
  Future<void> insertUser(User user) async {
    await _databaseHelper.insertUser(
      user.name,
      user.email,
      user.password,
      user.phone,
      user.image,
    );
  }

  @override
  Future<void> insertDaily(Daily daily) async {
    await _databaseHelper.insertDay(
      daily.day,
    );
  }

  @override
  Future<List<Daily>> getDailyPast() async {
    final dailyMap = await _databaseHelper.getDaysPast();
    return dailyMap.map((dailyMap) {
      log('DailyMap: $dailyMap');
      return Daily(
        id: dailyMap['id'] as int,
        day: dailyMap['date'] as String,
      );
    }).toList();
  }

  @override
  Future<void> deleteInventory(int id) async {
    await _databaseHelper.deleteInventory(id);
  }

  @override
  Future<List<Inventory>> getInventory() async {
    final inventoryMap = await _databaseHelper.getInventory();
    return inventoryMap.map((inventoryMap) {
      return Inventory(
        id: inventoryMap['id'] as int,
        name: inventoryMap['name'] as String,
        image: inventoryMap['image'] as String,
      );
    }).toList();
  }

  @override
  Future<int> insertInventory(String name, String image) async {
    return _databaseHelper.insertInventory(name, image);
  }
}
