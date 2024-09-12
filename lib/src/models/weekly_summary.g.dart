// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeeklySummaryImpl _$$WeeklySummaryImplFromJson(Map<String, dynamic> json) =>
    _$WeeklySummaryImpl(
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      totalTasks: (json['totalTasks'] as num).toInt(),
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => DailyTask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WeeklySummaryImplToJson(_$WeeklySummaryImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'totalTasks': instance.totalTasks,
      'tasks': instance.tasks,
    };
