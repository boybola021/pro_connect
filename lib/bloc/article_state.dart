part of 'article_bloc.dart';

abstract class ArticleState extends Equatable {
  final List<Article> items;
  final Article? article;
  const ArticleState({required this.items,this.article});
  @override
  List<Object> get props => [items];
}

class ArticleInitial extends ArticleState {
  const ArticleInitial({required super.items});

  @override
  List<Object> get props => [items];
}

class ArticleAllReadArticle extends ArticleState {
  const ArticleAllReadArticle({required super.items});

  @override
  List<Object> get props => [items];
}

class GetLatestArticlesState extends ArticleState {
  const GetLatestArticlesState({required super.items});

  @override
  List<Object> get props => [items];
}

class GetFeaturedArticlesState extends ArticleState {
  const GetFeaturedArticlesState({required super.items});
  @override
  List<Object> get props => [items];
}

class GetArticleState extends ArticleState {
  const GetArticleState({required super.items,super.article});
  @override

  List<Object> get props => [items,article!];
}


class ArticleFailureState extends ArticleState {
  final String message;
  const ArticleFailureState({required super.items,required this.message});

  @override
  List<Object> get props => [items,message];
}

class ArticleLoadingState extends ArticleState {
  const ArticleLoadingState({required super.items,});

  @override
  List<Object> get props => [items];
}