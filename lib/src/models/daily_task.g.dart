// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyTaskImpl _$$DailyTaskImplFromJson(Map<String, dynamic> json) =>
    _$DailyTaskImpl(
      id: (json['id'] as num).toInt(),
      taskName: json['taskName'] as String,
      taskDescription: json['taskDescription'] as String,
      date: json['date'] as String,
      isCompleted: json['isCompleted'] as bool,
      color: json['color'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$DailyTaskImplToJson(_$DailyTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskName': instance.taskName,
      'taskDescription': instance.taskDescription,
      'date': instance.date,
      'isCompleted': instance.isCompleted,
      'color': instance.color,
      'image': instance.image,
    };
