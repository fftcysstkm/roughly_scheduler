import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roughly_scheduler/pages/home/todos.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const path = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Rough Scheduler'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).go('/home/detail');
        },
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Todos(),
      ),
    );
  }
}
