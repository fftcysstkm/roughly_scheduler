import 'package:flutter/material.dart';
import 'package:roughly_scheduler/model/data/todo/todo.dart';

// ignore: slash_for_doc_comments
/**
 * Todoリスト画面パーツ
 *
 */
class Todos extends StatelessWidget {
  const Todos({super.key});

  static final todos = [
    Todo(
        id: '1',
        title: '電動歯ブラシのブラシ交換',
        dateTodo: DateTime(2023, 1, 12),
        isRepeat: false,
        isArchived: false),
    Todo(
        id: '2',
        title: '歯医者(定期検診)',
        dateTodo: DateTime(2023, 1, 20),
        isRepeat: false,
        isArchived: false),
    Todo(
        id: '3',
        title: '魚のフィルター交換',
        dateTodo: DateTime(2023, 2, 12),
        isRepeat: false,
        isArchived: false)
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const FlutterLogo(size: 56.0),
            title: Text(todos[index].title),
            trailing: const Icon(Icons.more_vert),
          ),
        );
      },
    );
  }
}
