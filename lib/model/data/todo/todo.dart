import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  factory Todo({
    // id
    required String id,
    // タイトル
    required String title,
    // todoを実行すべき日付
    required DateTime dateTodo,
    // 予定を繰り返すか
    required bool isRepeat,
    // アーカイブ済みか
    required bool isArchived,
  }) = _Todo;
}
