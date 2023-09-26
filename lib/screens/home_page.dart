import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_article_tasks/bloc/article_bloc.dart';
import 'package:new_article_tasks/views/custom_sliver_box.dart';
import 'package:new_article_tasks/views/custom_sliver_list.dart';
import 'package:new_article_tasks/views/text_widget.dart';
import '../service/icons.dart';
import 'new_article.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ArticleBloc>().add(const GetLatestArticlesEvent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: KTIcons.arrowBack,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NewArticle()));
                  }, child: KTextWidget.notificationTextWidget),
              TextButton(
                onPressed: () {
                  context.read<ArticleBloc>().add(
                        const GetReadArticlesEvent(),
                      );
                },
                child: KTextWidget.marcAllReadTextWidget,
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
          body: Stack(
            children: [
              SizedBox(
                child: state.items.isNotEmpty? CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: CustomSliverBox(article: state.items),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: state.items.length,
                              (context, i) {
                        final data = state.items[i];
                        return CustomSliverList(state: state, data: data);
                      }),
                    ),
                  ],
                ) : const Center(child: CircularProgressIndicator.adaptive(),),
              ),
            ],
          ),
        );
      },
    );
  }
}
