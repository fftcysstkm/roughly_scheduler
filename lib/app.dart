import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roughly_scheduler/pages/archive/archive_page.dart';
import 'package:roughly_scheduler/pages/home/home_page.dart';

class App extends StatelessWidget {
  App({super.key});

  final _router = GoRouter(routes: [
    GoRoute(
      path: HomePage.path,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: ArchivePage.path,
      builder: (context, state) => const ArchivePage(),
    )
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
