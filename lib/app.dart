import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roughly_scheduler/pages/todo/todo_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: _buildLightTheme(),
        darkTheme: _buildDarkTheme(),
        home: Scaffold(
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
        ));
  }
}

// ignore: slash_for_doc_comments
/**
 * BottomNvigationBar。選択中のアイテムにPrimaryColorを適用するため、StatelessWidgetを継承している。
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

// ライトテーマを生成する
ThemeData _buildLightTheme() {
  // 色を設定
  const primaryColor = Color(0xff0097a7);
  const secondaryColor = Color(0xfffcd734);
  final colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
    error: const Color(0xFFB00020),
  );

  // appbarとfabの色設定
  const appBarTheme = AppBarTheme(backgroundColor: primaryColor);
  const floatingActionButtonTheme = FloatingActionButtonThemeData(
      backgroundColor: secondaryColor, foregroundColor: Colors.white);

  // テキスト設定
  final textTheme = GoogleFonts.notoSansTextTheme();

  return ThemeData.light().copyWith(
      textTheme: textTheme,
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      appBarTheme: appBarTheme,
      floatingActionButtonTheme: floatingActionButtonTheme);
}

// ダークテーマを生成する
ThemeData _buildDarkTheme() {
  // 色を設定
  const primaryColor = Color(0xff006978);
  const secondaryColor = Color(0xffc5a600);
  final colorScheme = const ColorScheme.dark().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
    onPrimary: Colors.white,
    error: const Color(0xFFB00020),
  );

  // appbarとfabの色設定
  const appBarTheme = AppBarTheme(backgroundColor: primaryColor);
  const floatingActionButtonTheme = FloatingActionButtonThemeData(
      backgroundColor: secondaryColor, foregroundColor: Colors.white);

  // テキスト設定
  final textTheme = GoogleFonts.notoSansTextTheme(ThemeData.dark().textTheme);

  return ThemeData.dark().copyWith(
      textTheme: textTheme,
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      appBarTheme: appBarTheme,
      floatingActionButtonTheme: floatingActionButtonTheme);
}
