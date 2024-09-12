import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_task.freezed.dart';
part 'daily_task.g.dart';

@freezed
class DailyTask with _$DailyTask {
  const factory DailyTask({
    required int id,
    required String taskName,
    required String taskDescription,
    required String date,
    required bool isCompleted,
    required String color,
    required String image,
  }) = _DailyTask;

  factory DailyTask.fromJson(Map<String, dynamic> json) =>
      _$DailyTaskFromJson(json);
}
