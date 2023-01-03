import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ToDoDetail extends StatelessWidget {
  const ToDoDetail({super.key});

  static const path = 'detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Rough Scheduler'),
          leading: IconButton(
              onPressed: (() => GoRouter.of(context).pop()),
              icon: const Icon(Icons.arrow_back)),
        ),
        body: const Center(child: Text('登録または更新共通画面')));
  }
}
