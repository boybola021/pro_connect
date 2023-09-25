import 'package:flutter_test/flutter_test.dart';
import 'package:new_article_tasks/core/service_locatory.dart';

void main()async{

  test("Day", ()async{
     final data = await repository.getFeaturedArticles();
    data.sort((a, b) => a.publicationDate.day.compareTo(b.publicationDate.day));
    print(data);
  });
}