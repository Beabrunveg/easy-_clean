import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/repositories/database_repository.dart';

@lazySingleton
class GetWeeklyTaskCount {
  GetWeeklyTaskCount(this.repository);
  final DatabaseRepository repository;

  Future<Either<Exception, List<WeeklySummary>>> execute() async {
    final weeklySummary = <WeeklySummary>[];
    const numberOfWeeks = 4;
    final weeksList = getPreviousWeeksDates(numberOfWeeks);
    for (final weekDates in weeksList) {
      for (final date in weekDates) {
        final result = await repository.getWeeklyTaskCount(
          date,
          date,
        );
        result.fold((l) {}, (r) {
          log('WeeklySummary: ${r.tasks}');
          weeklySummary.add(r);
        });
      }
    }
    return weeklySummary.isEmpty ? right([]) : right(weeklySummary);
  }
}

List<List<DateTime>> getPreviousWeeksDates(int numberOfWeeks) {
  final now = DateTime.now();
  final startOfCurrentWeek = _findFirstMonday(now);

  // Lista para almacenar las semanas de fechas
  final weeksDatesList = <List<DateTime>>[];

  var startOfWeek = startOfCurrentWeek
      .subtract(const Duration(days: 7)); // Comienza desde la semana anterior

  for (var i = 0; i < numberOfWeeks; i++) {
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    final weekDates = <DateTime>[];

    for (var date = startOfWeek;
        date.isBefore(endOfWeek.add(const Duration(days: 1)));
        date = date.add(const Duration(days: 1))) {
      weekDates.add(date);
    }

    weeksDatesList.add(weekDates);

    // Retroceder una semana
    startOfWeek = startOfWeek.subtract(const Duration(days: 7));
  }

  return weeksDatesList;
}

DateTime _findFirstMonday(DateTime date) {
  final weekday = date.weekday;
  final daysToSubtract =
      (weekday == DateTime.monday) ? 0 : ((weekday - DateTime.monday + 7) % 7);
  return date.subtract(Duration(days: daysToSubtract));
}
