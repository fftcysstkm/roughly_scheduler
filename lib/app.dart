import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light()
            .copyWith(textTheme: GoogleFonts.notoSansTextTheme()),
        darkTheme: ThemeData.dark()
            .copyWith(textTheme: GoogleFonts.notoSansTextTheme()),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Roughly Scheduler'),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    (Icons.more_vert),
                  ))
            ],
          ),
          body: const Center(
            child: Text('Hello World'),
          ),
        ));
  }
}
