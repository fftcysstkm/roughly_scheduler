import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roughly_scheduler/model/data/todo/todo.dart';

// 未完了のToDoリストを提供するProvider
final allTodosProvider =
    StateNotifierProvider<TodoNotifier, List<Todo>>((ref) => TodoNotifier());

final filterdTodosProvider = Provider.family((ref, bool isArchivePage) {
  final allTodos = ref.watch(allTodosProvider);
  // アーカイブページの場合はアーカイブ済みのToDoのみを返す
  if (isArchivePage) {
    return allTodos.where((todo) => todo.isArchived).toList();
  }
  // それ以外の場合は未完了のToDoのみを返す
  return allTodos.where((todo) => !todo.isArchived).toList();
});

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier()
      : super([
          Todo(
              id: '1',
              title: '電動歯ブラシのブラシ交換',
              duration: NotificationDuration(year: 0, month: 2, week: 0),
              isRepeated: true,
              dateTodo: DateTime(2023, 1, 12),
              isArchived: false),
          Todo(
              id: '2',
              title: '歯医者(定期検診)',
              duration: NotificationDuration(year: 0, month: 6, week: 0),
              isRepeated: true,
              dateTodo: DateTime(2023, 2, 2),
              isArchived: false),
          Todo(
              id: '3',
              title: '魚のフィルター交換',
              duration: NotificationDuration(year: 0, month: 3, week: 0),
              isRepeated: true,
              dateTodo: DateTime(2023, 1, 27),
              isArchived: false),
          Todo(
              id: '4',
              title: '冷蔵庫の掃除',
              duration: NotificationDuration(year: 0, month: 1, week: 0),
              isRepeated: true,
              dateTodo: DateTime(2023, 3, 16),
              isArchived: false),
          Todo(
              id: '5',
              title: 'PCのファンの掃除',
              duration: NotificationDuration(year: 0, month: 3, week: 0),
              isRepeated: true,
              dateTodo: DateTime(2023, 12, 17),
              isArchived: false),
          Todo(
              id: '6',
              title: '電動シェーバーの刃交換',
              duration: NotificationDuration(year: 2, month: 0, week: 0),
              isRepeated: true,
              dateTodo: DateTime(2023, 1, 7),
              isArchived: true),
          Todo(
              id: '7',
              title: '空気清浄機のフィルター交換',
              duration: NotificationDuration(year: 1, month: 0, week: 0),
              isRepeated: true,
              dateTodo: DateTime(2023, 1, 7),
              isArchived: true)
        ]);

  void toggleArchive(String id) {
    // 選択したTodoのisArchivedを反転させる
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(isArchived: !todo.isArchived)
        else
          todo,
    ];
  }
}
