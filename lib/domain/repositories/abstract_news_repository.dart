
import '../../model/aticle_model.dart';

abstract class AbstractNewsRepository {
  Future<List<Article>> getLatestArticles();
  Future<List<Article>> getFeaturedArticles();
  Future<Article> getArticle(String id);
}

class MockNewsRepositoryImpl implements AbstractNewsRepository {
 final List<Article> mockArticles;
  const MockNewsRepositoryImpl({required this.mockArticles});

  @override
  Future<List<Article>> getLatestArticles() async {
    return mockArticles;
  }

  @override
  Future<Article> getArticle(String id) async {
    return mockArticles.firstWhere((e) => e.id == id);
  }

  @override
  Future<List<Article>> getFeaturedArticles() async {
    return mockArticles;
  }
}