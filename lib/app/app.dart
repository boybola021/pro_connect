import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_article_tasks/bloc/article_bloc.dart';
import 'package:new_article_tasks/screens/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ArticleBloc(),
      child: ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(useMaterial3: true),
              themeMode: ThemeMode.light,
              darkTheme: ThemeData.light(useMaterial3: true),
              home: const HomePage(),
            );
          }
      ),
    );
  }
}
