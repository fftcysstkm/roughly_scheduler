import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roughly_scheduler/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final testStrProvider = Provider(((_) => 'Test String'));

void main() {
  // 画面の向きを立てに固定する
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // Riverpodを使う
  runApp(ProviderScope(child: App()));
}
