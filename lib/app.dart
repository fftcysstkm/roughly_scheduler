import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roughly_scheduler/pages/todo/todo_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light().copyWith(
            textTheme: GoogleFonts.notoSansTextTheme(),
            primaryColor: Colors.lightBlue,
            highlightColor: Colors.lightBlue),
        darkTheme: ThemeData.dark().copyWith(
            textTheme:
                GoogleFonts.notoSansTextTheme(ThemeData.dark().textTheme),
            primaryColor: Colors.lightBlue,
            highlightColor: Colors.lightBlue),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Rough Scheduler'),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    (Icons.more_vert),
                  ))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
            child: const Icon(Icons.add),
          ),
          body: const Center(
            child: Todos(),
          ),
        ));
  }
}
