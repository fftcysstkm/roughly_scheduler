// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Todo {
// id
  String get id => throw _privateConstructorUsedError; // タイトル
  String get title => throw _privateConstructorUsedError; // お知らせ間隔
  NotificationDuration get duration =>
      throw _privateConstructorUsedError; // お知らせを繰り返すかどうか
  bool get isRepeated => throw _privateConstructorUsedError; // メモ(任意)
  String? get memo => throw _privateConstructorUsedError; // todoを実行すべき日付
  DateTime get dateTodo => throw _privateConstructorUsedError; // アーカイブ済みか
  bool get isArchived => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoCopyWith<Todo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) then) =
      _$TodoCopyWithImpl<$Res, Todo>;
  @useResult
  $Res call(
      {String id,
      String title,
      NotificationDuration duration,
      bool isRepeated,
      String? memo,
      DateTime dateTodo,
      bool isArchived});
}

/// @nodoc
class _$TodoCopyWithImpl<$Res, $Val extends Todo>
    implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? duration = null,
    Object? isRepeated = null,
    Object? memo = freezed,
    Object? dateTodo = null,
    Object? isArchived = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as NotificationDuration,
      isRepeated: null == isRepeated
          ? _value.isRepeated
          : isRepeated // ignore: cast_nullable_to_non_nullable
              as bool,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTodo: null == dateTodo
          ? _value.dateTodo
          : dateTodo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$$_TodoCopyWith(_$_Todo value, $Res Function(_$_Todo) then) =
      __$$_TodoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      NotificationDuration duration,
      bool isRepeated,
      String? memo,
      DateTime dateTodo,
      bool isArchived});
}

/// @nodoc
class __$$_TodoCopyWithImpl<$Res> extends _$TodoCopyWithImpl<$Res, _$_Todo>
    implements _$$_TodoCopyWith<$Res> {
  __$$_TodoCopyWithImpl(_$_Todo _value, $Res Function(_$_Todo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? duration = null,
    Object? isRepeated = null,
    Object? memo = freezed,
    Object? dateTodo = null,
    Object? isArchived = null,
  }) {
    return _then(_$_Todo(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as NotificationDuration,
      isRepeated: null == isRepeated
          ? _value.isRepeated
          : isRepeated // ignore: cast_nullable_to_non_nullable
              as bool,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTodo: null == dateTodo
          ? _value.dateTodo
          : dateTodo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Todo extends _Todo {
  _$_Todo(
      {required this.id,
      required this.title,
      required this.duration,
      required this.isRepeated,
      this.memo,
      required this.dateTodo,
      required this.isArchived})
      : super._();

// id
  @override
  final String id;
// タイトル
  @override
  final String title;
// お知らせ間隔
  @override
  final NotificationDuration duration;
// お知らせを繰り返すかどうか
  @override
  final bool isRepeated;
// メモ(任意)
  @override
  final String? memo;
// todoを実行すべき日付
  @override
  final DateTime dateTodo;
// アーカイブ済みか
  @override
  final bool isArchived;

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, duration: $duration, isRepeated: $isRepeated, memo: $memo, dateTodo: $dateTodo, isArchived: $isArchived)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Todo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.isRepeated, isRepeated) ||
                other.isRepeated == isRepeated) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.dateTodo, dateTodo) ||
                other.dateTodo == dateTodo) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, duration, isRepeated, memo, dateTodo, isArchived);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoCopyWith<_$_Todo> get copyWith =>
      __$$_TodoCopyWithImpl<_$_Todo>(this, _$identity);
}

abstract class _Todo extends Todo {
  factory _Todo(
      {required final String id,
      required final String title,
      required final NotificationDuration duration,
      required final bool isRepeated,
      final String? memo,
      required final DateTime dateTodo,
      required final bool isArchived}) = _$_Todo;
  _Todo._() : super._();

  @override // id
  String get id;
  @override // タイトル
  String get title;
  @override // お知らせ間隔
  NotificationDuration get duration;
  @override // お知らせを繰り返すかどうか
  bool get isRepeated;
  @override // メモ(任意)
  String? get memo;
  @override // todoを実行すべき日付
  DateTime get dateTodo;
  @override // アーカイブ済みか
  bool get isArchived;
  @override
  @JsonKey(ignore: true)
  _$$_TodoCopyWith<_$_Todo> get copyWith => throw _privateConstructorUsedError;
}
