part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();
  @override
  List<Object> get props => [];
}


class GetLatestArticlesEvent extends ArticleEvent {
  const GetLatestArticlesEvent();
}

class GetReadArticlesEvent extends ArticleEvent {
  const GetReadArticlesEvent();
}

class GetFeaturedArticlesEvent extends ArticleEvent {
  const GetFeaturedArticlesEvent();
}

class GetArticleEvent extends ArticleEvent {
  final String id;
  const GetArticleEvent({required this.id});
  @override
  List<Object> get props => [id];
}
