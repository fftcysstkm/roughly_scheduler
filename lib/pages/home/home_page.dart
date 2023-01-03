import 'package:flutter/material.dart';
import 'package:roughly_scheduler/pages/home/todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const path = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Rough Scheduler'),
      ),
      bottomNavigationBar: _BottomNavBar(context: context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Todos(),
      ),
    );
  }
}

// ignore: slash_for_doc_comments
/**
 * BottomNvigationBar。選択中のアイテムに親ウィジェットのcontextを利用してPrimaryColorを適用するため、StatelessWidgetを継承している。
 * https://stackoverflow.com/questions/50917350/custom-theme-not-working-properly-flutter
 */
class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({required this.context});
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archive'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      selectedItemColor: Theme.of(context).primaryColor,
      elevation: 20.0,
    );
  }
}
