import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:roughly_scheduler/main.dart';
import 'package:roughly_scheduler/model/data/todo/todo.dart';
import 'package:roughly_scheduler/pages/todo_card/todo_card.dart';

class ArchivePage extends ConsumerWidget {
  const ArchivePage({super.key});

  static const path = '/archive';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final str = ref.watch(testStrProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Rough Scheduler'),
      ),
      body: _ArchivedTodos(),
    );
  }
}

class _ArchivedTodos extends StatelessWidget {
  _ArchivedTodos();
  final List<Todo> todos = testTodos.where((todo) => todo.isArchived).toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 12.0, bottom: 4.0, left: 140, right: 140),
            child: Container(
              height: 20,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(8)),
              child: Text(
                'アーカイブ',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          // アーカイブされたTodoリスト
          Expanded(
            child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return Slidable(
                      key: const ValueKey(0),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(onDismissed: () {}),
                        dragDismissible: false,
                        children: [
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
                      child: TodoCard(todo: todos[index]));
                }),
          ),
        ],
      ),
    );
  }
}
