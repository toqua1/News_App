import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService{
  Dio dio;
  final String baseUrl ='https://newsapi.org/v2' ;
  final String apiKey = '2331900ba9604bb79ac7c9943306ba6c' ;

  NewsService(this.dio);

  Future<List<ArticleModel>> getHeadlinesNews(String category) async {
    try {
      Response response = await dio.get(
          '${baseUrl}/top-headlines?country=us&apiKey=${apiKey}&category=${category}');

      Map<String, dynamic> jsonData = response.data;
      /*return data either List<dynamic> or Map<String , dynamic>*/

      /*data here in Dio is in form of Map and we can use it easily
      => Dio converted String to Map already but in HTTP we need to convert
      first String to Map */

      List<dynamic> articles = jsonData['articles'];

      /*
     if we switch List<dynamic> by List<Map<String,dynamic>> as we know
     that data is really of this type,it will return exception => as
     jsonData['articles'] return List<dynamic> , to solve this exception =>
     either by above way or this :
       List<Map<String,dynamic>> articles=jsonData['articles'] as Map<String,dynamic> ;
       */

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
            img: article['urlToImage'],
            title: article['title'],
            subtitle: article['description']
        );
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
        return [] ;
    }
  }

}