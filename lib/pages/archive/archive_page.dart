import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  static const path = '/archive';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Rough Scheduler'),
        ),
        body: const Center(child: Text('archive')));
  }
}