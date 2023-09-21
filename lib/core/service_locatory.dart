
import 'package:new_article_tasks/mock_database/mock_data.dart';

import '../domain/repositories/abstract_news_repository.dart';

late AbstractNewsRepository repository;

void serviceLocator(){
 repository = MockNewsRepositoryImpl(mockArticles: mockArticles);
}