

import 'package:flutter/material.dart';
import 'package:new_article_tasks/screens/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.light(useMaterial3: true),
      home: const HomePage(),
    );
  }
}
