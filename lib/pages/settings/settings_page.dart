import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const path = 'detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Rough Scheduler'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text('プッシュ通知を許可する',
                      style: Theme.of(context).textTheme.bodyMedium),
                  Expanded(child: Container()),
                  const _Switch(),
                ],
              )
            ],
          ),
        ));
  }
}

class _Switch extends StatefulWidget {
  const _Switch();

  @override
  State<_Switch> createState() => _SwitchState();
}

class _SwitchState extends State<_Switch> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: light,
        onChanged: ((value) {
          setState(() {
            light = value;
          });
        }));
  }
}
