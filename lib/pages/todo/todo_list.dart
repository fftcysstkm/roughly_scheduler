import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
        return Slidable(
            key: const ValueKey(0),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              dragDismissible: false,
              children: [
                // アーカイブボタン
                SlidableAction(
                  onPressed: (context) {},
                  backgroundColor: const Color(0xFF7BC043),
                  foregroundColor: Colors.white,
                  icon: Icons.archive,
                ),
                // 削除ボタン
                SlidableAction(
                  onPressed: (context) {},
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                ),
                // 編集ボタン
                SlidableAction(
                  onPressed: (context) {},
                  backgroundColor: const Color(0xFF0392CF),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                ),
              ],
            ),
            child: _TodoCard(todo: todos[index]));
      },
    );
  }
}

// ignore: slash_for_doc_comments
/**
 * Todoリスト1行のパーツ
 *
 */
class _TodoCard extends StatelessWidget {
  const _TodoCard({required this.todo});
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const FlutterLogo(size: 56.0),
        title: Text(todo.title),
      ),
    );
  }
}
