import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:roughly_scheduler/dialog/dialog.dart';
import 'package:roughly_scheduler/model/data/todo/todo.dart';

import 'package:roughly_scheduler/pages/todo_card/todo_card.dart';
import 'package:roughly_scheduler/pages/todo_detail/todo_detail.dart';

// ignore: slash_for_doc_comments
/**
 * Todoリスト画面パーツ
 *
 */
class Todos extends StatelessWidget {
  const Todos({super.key});

  @override
  Widget build(BuildContext context) {
    return GroupedListView<Todo, String>(
      padding: const EdgeInsets.all(8.0),
      elements: testTodos.where((todo) => !todo.isArchived).toList(),
      groupBy: (todo) => todo.deadLine.label,
      groupComparator: (deadLineLabel1, deadLineLabel2) {
        final deadLine1 = DeadLine.getDeadLineByLabel(deadLineLabel1);
        final deadLine2 = DeadLine.getDeadLineByLabel(deadLineLabel2);
        return deadLine1.displayOrder.compareTo(deadLine2.displayOrder);
      },
      floatingHeader: true,
      groupSeparatorBuilder: (String label) => Padding(
          padding: const EdgeInsets.only(
              top: 12.0, bottom: 4.0, left: 140, right: 140),
          child: Container(
            height: 20,
            width: 10,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(8)),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )),
      itemBuilder: (context, todo) {
        return Slidable(
            key: const ValueKey(0),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              dragDismissible: false,
              children: [
                // 削除ボタン
                SlidableAction(
                  onPressed: (context) {
                    dialogBuilder(
                        context: context,
                        title: '削除します。',
                        content: '本当によろしいですか？',
                        okText: '削除する',
                        cancelText: 'キャンセル',
                        okAction: () {},
                        cancelAction: () {});
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                ),
                // アーカイブボタン
                SlidableAction(
                  onPressed: (context) {
                    dialogBuilder(
                        context: context,
                        title: 'アーカイブします。',
                        content: 'よろしいですか？',
                        okText: 'アーカイブする',
                        cancelText: 'キャンセル',
                        okAction: () {},
                        cancelAction: () {});
                  },
                  backgroundColor: const Color(0xFF7BC043),
                  foregroundColor: Colors.white,
                  icon: Icons.archive,
                ),
                // 編集ボタン
                SlidableAction(
                  onPressed: (context) {
                    GoRouter.of(context).go('/home/${ToDoDetail.path}');
                  },
                  backgroundColor: const Color(0xFF0392CF),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                ),
              ],
            ),
            child: TodoCard(todo: todo));
      },
    );
  }
}
