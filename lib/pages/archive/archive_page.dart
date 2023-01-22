import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roughly_scheduler/main.dart';

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
        body: Center(child: Text('archiveです。 $str')));
  }
}
