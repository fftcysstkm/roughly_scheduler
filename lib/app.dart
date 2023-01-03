import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roughly_scheduler/pages/archive/archive_page.dart';
import 'package:roughly_scheduler/pages/home/home_page.dart';
import 'package:roughly_scheduler/pages/settings/settings_page.dart';
import 'package:roughly_scheduler/pages/todo_detail/todo_detail.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class App extends StatelessWidget {
  App({super.key});

  final _router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/home',
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder:
                (BuildContext context, GoRouterState state, Widget child) =>
                    ScafforldWithNavBar(child: child),
            routes: [
              // Home画面(Bottom Nav Barの1つ目の画面)
              GoRoute(
                  path: '/home',
                  builder: (context, state) => const HomePage(),
                  routes: [
                    // ToDo詳細画面（/home/detail)。ToDoの更新と追加画面。
                    GoRoute(
                        path: 'detail',
                        parentNavigatorKey: _rootNavigatorKey,
                        builder: (context, state) => const ToDoDetail())
                  ]),
              // アーカイブ画面(Bottom Nav Barの2つ目の画面)
              GoRoute(
                  path: '/archive',
                  builder: (context, state) => const ArchivePage(),
                  routes: [
                    // ToDo詳細画面（/archive/detail）
                    GoRoute(
                      path: 'detail',
                      parentNavigatorKey: _rootNavigatorKey,
                      builder: (context, state) => const ToDoDetail(),
                    )
                  ]),
              // 設定画面(Bottom Nav Barの3つ目の画面)
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsPage(),
              )
            ]),
      ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      routerConfig: _router,
    );
  }
}

class ScafforldWithNavBar extends StatelessWidget {
  const ScafforldWithNavBar({super.key, required this.child});
  // Scafold内に表示されるWidget
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive), label: 'Archive'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
          selectedItemColor: Theme.of(context).primaryColor,
          elevation: 20.0,
          currentIndex: _calculateSelectedIndex(context),
          onTap: (index) => _onItemTapped(index, context),
        ));
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/archive')) {
      return 1;
    }
    if (location.startsWith('/settings')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    GoRouter router = GoRouter.of(context);
    switch (index) {
      case 0:
        router.go('/home');
        break;
      case 1:
        router.go('/archive');
        break;
      case 2:
        router.go('/settings');
        break;
    }
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
