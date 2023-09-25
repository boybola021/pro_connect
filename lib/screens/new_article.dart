import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_article_tasks/bloc/article_bloc.dart';
import 'package:new_article_tasks/views/text_widget.dart';
import 'detail_page.dart';

class NewArticle extends StatefulWidget {
  const NewArticle({Key? key}) : super(key: key);

  @override
  State<NewArticle> createState() => _NewArticleState();
}

class _NewArticleState extends State<NewArticle> {
  @override
  void initState() {
    super.initState();
    context.read<ArticleBloc>().add(const GetFeaturedArticlesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: KTextWidget.notificationTextWidget,
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context,i){
              final data = state.items[i];
              return Card(
                margin: const  EdgeInsets.symmetric(horizontal: 15,vertical: 10),
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
                    child: Expanded(
                      child: Image.network(data.imageUrl,
                        errorBuilder: (error,child,__){
                          return const CircularProgressIndicator.adaptive();
                        },),
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
            },
          );
        },
      ),
    );
  }
}
