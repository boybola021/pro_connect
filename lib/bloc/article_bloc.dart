import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_article_tasks/core/service_locatory.dart';
import 'package:new_article_tasks/model/aticle_model.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(const ArticleInitial(items: [])) {
    on<GetLatestArticlesEvent>(_getLatestArticles);
    on<GetFeaturedArticlesEvent>(_getFeaturedArticles);
    on<GetArticleEvent>(_getArticle);
    on<GetReadArticlesEvent>(_getAllReadArticle);
  }

  void _getLatestArticles(GetLatestArticlesEvent event,Emitter<ArticleState> emit)async{

    try{
      emit(const ArticleLoadingState(items: []));

      var data = await repository.getLatestArticles();
      data.sort((a,b) => b.publicationDate.day.compareTo(a.publicationDate.day));

      if(data.isNotEmpty){
        emit(GetLatestArticlesState(items: [...data]));
      }else{
        emit(ArticleFailureState(items: [...state.items], message: "No data"));
        return;
      }
    }catch(e){
      emit(ArticleFailureState(items: [...state.items], message: "Something error"));
    }
  }

  void _getFeaturedArticles(GetFeaturedArticlesEvent event,Emitter<ArticleState> emit)async{
    try{
      emit(const ArticleLoadingState(items: []));
      final data = await repository.getFeaturedArticles();
      data.sort((a,b) => b.publicationDate.day.compareTo(a.publicationDate.day));
      List<Article> list = data.where((e) => DateTime.now().day - e.publicationDate.day == 1).toList();

      if(list.isNotEmpty){
        emit(GetFeaturedArticlesState(items: [...list]));
      }else{
        emit(ArticleFailureState(items: [...state.items], message: "No data"));
        return;
      }
    }catch(e){
      emit(ArticleFailureState(items: [...state.items], message: "Something error"));
    }
  }

  void _getArticle(GetArticleEvent event,Emitter<ArticleState> emit)async{

    try{
      emit(const ArticleLoadingState(items: []));
      Article data = await repository.getArticle(event.id);
      if(data != null){
        emit(GetArticleState(items: [],article: data));
        log("GetArticleEvent => $data");
      }else{
        emit(ArticleFailureState(items: [...state.items], message: "No data"));
        return;
      }
    }catch(e){
      emit(ArticleFailureState(items: [...state.items], message: "Something error"));
    }
  }

  void _getAllReadArticle(GetReadArticlesEvent event,Emitter<ArticleState>emit)async{
    emit(ArticleLoadingState(items: [...state.items]));
    emit(ArticleAllReadArticle(items: [...state.items]));
  }

}
