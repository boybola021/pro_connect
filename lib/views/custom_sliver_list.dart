



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_article_tasks/bloc/article_bloc.dart';
import 'package:new_article_tasks/screens/detail_page.dart';
import 'package:new_article_tasks/views/text_widget.dart';

class CustomSliverList extends StatelessWidget {
  final state;
  final  data;
  const CustomSliverList({Key? key,required this.state,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius:
        const BorderRadius.all(Radius.circular(15)),
        color: state is! ArticleAllReadArticle
            ? Colors.white
            : Colors.grey.shade300,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0.0, 0.0),
              blurRadius: 10,
              spreadRadius: 10,
              color: Colors.grey.shade200)
        ],
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailPage(id: data.id)));
        },
        leading: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius:
            BorderRadius.all(Radius.circular(10)),
          ),
          child: SizedBox(
            child:  Image.network(data.imageUrl,),
          ),
        ),
        title: TextVerticalTitleWidget(
          title: data.title,
        ),
        subtitle: TextSubtitleWidget(
            subtitleText: "${DateTime.now().day - data.publicationDate.day} day ago"
        ),
      ),
    );
  }
}
