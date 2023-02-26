// ignore: slash_for_doc_comments
import 'package:flutter/material.dart';

import 'package:roughly_scheduler/model/data/todo/todo.dart';

/**
 * Todoリスト1行のパーツ
 *
 */
class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todo});
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Card(
        elevation: 4.0,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 12.0),
              child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 45),
                  child: SizedBox(child: Leading(todo: todo))),
            ),
            TodoCardText(todo: todo)
          ],
        ),
      ),
    );
  }
}

/**
 * Todoカード内のタイトル、通知間隔テキスト
 */
class TodoCardText extends StatelessWidget {
  const TodoCardText({super.key, required this.todo});
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // タイトル
        Text(todo.title, style: Theme.of(context).textTheme.bodyMedium),
        // 通知間隔
        Text('通知間隔:${todo.durationString()}',
            style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

/**
 * 通知まで何日かを表示するパーツ
 * カードの左側に表示する
 * 日数がマイナスだったらビックリマークを表示する
 */
class Leading extends StatelessWidget {
  const Leading({super.key, required this.todo});
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    // アーカイブされていたらアーカイブアイコン表示(アーカイブページで使用)
    if (todo.isArchived) {
      return Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        child: const Icon(
          Icons.archive,
          color: Colors.grey,
        ),
      );
    }
    // それ以外
    // 通知までの日数をすぎていたら!マーク
    if (todo.daysLeft() < 0) {
      return Text(
        textAlign: TextAlign.center,
        '!',
        style:
            Theme.of(context).textTheme.headline4?.copyWith(color: Colors.red),
      );
    }
    // それ以外は残り日数
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          todo.daysLeft().toString(),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        Text('日', style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
