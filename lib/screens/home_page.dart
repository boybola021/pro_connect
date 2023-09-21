import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_article_tasks/core/service_locatory.dart';
import 'package:new_article_tasks/model/aticle_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> list = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  void fetchData()async{
    list = await repository.getLatestArticles();
    print("=====> fetchData => ${list.length}");
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("NO Data",style: TextStyle(fontSize: 30),),),

    );
  }
}
