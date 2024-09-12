// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyTask _$DailyTaskFromJson(Map<String, dynamic> json) {
  return _DailyTask.fromJson(json);
}

/// @nodoc
mixin _$DailyTask {
  int get id => throw _privateConstructorUsedError;
  String get taskName => throw _privateConstructorUsedError;
  String get taskDescription => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  /// Serializes this DailyTask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyTaskCopyWith<DailyTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyTaskCopyWith<$Res> {
  factory $DailyTaskCopyWith(DailyTask value, $Res Function(DailyTask) then) =
      _$DailyTaskCopyWithImpl<$Res, DailyTask>;
  @useResult
  $Res call(
      {int id,
      String taskName,
      String taskDescription,
      String date,
      bool isCompleted,
      String color,
      String image});
}

/// @nodoc
class _$DailyTaskCopyWithImpl<$Res, $Val extends DailyTask>
    implements $DailyTaskCopyWith<$Res> {
  _$DailyTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskName = null,
    Object? taskDescription = null,
    Object? date = null,
    Object? isCompleted = null,
    Object? color = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      taskName: null == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String,
      taskDescription: null == taskDescription
          ? _value.taskDescription
          : taskDescription // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyTaskImplCopyWith<$Res>
    implements $DailyTaskCopyWith<$Res> {
  factory _$$DailyTaskImplCopyWith(
          _$DailyTaskImpl value, $Res Function(_$DailyTaskImpl) then) =
      __$$DailyTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String taskName,
      String taskDescription,
      String date,
      bool isCompleted,
      String color,
      String image});
}

/// @nodoc
class __$$DailyTaskImplCopyWithImpl<$Res>
    extends _$DailyTaskCopyWithImpl<$Res, _$DailyTaskImpl>
    implements _$$DailyTaskImplCopyWith<$Res> {
  __$$DailyTaskImplCopyWithImpl(
      _$DailyTaskImpl _value, $Res Function(_$DailyTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskName = null,
    Object? taskDescription = null,
    Object? date = null,
    Object? isCompleted = null,
    Object? color = null,
    Object? image = null,
  }) {
    return _then(_$DailyTaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      taskName: null == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String,
      taskDescription: null == taskDescription
          ? _value.taskDescription
          : taskDescription // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyTaskImpl implements _DailyTask {
  const _$DailyTaskImpl(
      {required this.id,
      required this.taskName,
      required this.taskDescription,
      required this.date,
      required this.isCompleted,
      required this.color,
      required this.image});

  factory _$DailyTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyTaskImplFromJson(json);

  @override
  final int id;
  @override
  final String taskName;
  @override
  final String taskDescription;
  @override
  final String date;
  @override
  final bool isCompleted;
  @override
  final String color;
  @override
  final String image;

  @override
  String toString() {
    return 'DailyTask(id: $id, taskName: $taskName, taskDescription: $taskDescription, date: $date, isCompleted: $isCompleted, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyTaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskName, taskName) ||
                other.taskName == taskName) &&
            (identical(other.taskDescription, taskDescription) ||
                other.taskDescription == taskDescription) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, taskName, taskDescription,
      date, isCompleted, color, image);

  /// Create a copy of DailyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyTaskImplCopyWith<_$DailyTaskImpl> get copyWith =>
      __$$DailyTaskImplCopyWithImpl<_$DailyTaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyTaskImplToJson(
      this,
    );
  }
}

abstract class _DailyTask implements DailyTask {
  const factory _DailyTask(
      {required final int id,
      required final String taskName,
      required final String taskDescription,
      required final String date,
      required final bool isCompleted,
      required final String color,
      required final String image}) = _$DailyTaskImpl;

  factory _DailyTask.fromJson(Map<String, dynamic> json) =
      _$DailyTaskImpl.fromJson;

  @override
  int get id;
  @override
  String get taskName;
  @override
  String get taskDescription;
  @override
  String get date;
  @override
  bool get isCompleted;
  @override
  String get color;
  @override
  String get image;

  /// Create a copy of DailyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyTaskImplCopyWith<_$DailyTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
