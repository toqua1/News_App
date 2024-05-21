// import 'package:dio/dio.dart';
// import 'package:news_app/models/article_model.dart';
//
// import '../models/news_item.dart';
//
// class NewsService{
//   Dio dio;
//   final String baseUrl ='https://newsapi.org/v2' ;
//   final String apiKey = '2331900ba9604bb79ac7c9943306ba6c' ;

//   NewsService(this.dio);
//
//   Future<List<NewsItem>> getHeadlinesNews(String category) async {
//     try {
//       Response response = await dio.get(
//           '${baseUrl}/top-headlines?country=us&apiKey=${apiKey}&category=${category}');

//       Map<String, dynamic> jsonData = response.data;
//       /*return data either List<dynamic> or Map<String , dynamic>*/
//
//       /*data here in Dio is in form of Map and we can use it easily
//       => Dio converted String to Map already but in HTTP we need to convert
//       first String to Map */
//
//       List<dynamic> articles = jsonData['articles'];
//
//       /*
//      if we switch List<dynamic> by List<Map<String,dynamic>> as we know
//      that data is really of this type,it will return exception => as
//      jsonData['articles'] return List<dynamic> , to solve this exception =>
//      either by above way or this :
//        List<Map<String,dynamic>> articles=jsonData['articles'] as Map<String,dynamic> ;
//        */
//
//       List<NewsItem> news = [];
//
//       for (var article in articles) {
//         NewsItem newsItem = NewsItem(
//             imgUrl: article['urlToImage'],
//             title: article['title'],
//             source: article['source']['name'],
//             content: article['content'],
//             category: category,
//             author: article['author'],
//             publishedAt: article['publishedAt'],
//             desc: article['description']
//         );
//         news.add(newsItem);
//       }
//       return news;
//     } catch (e) {
//         return [] ;
//     }
//   }
//
// }
import 'package:dio/dio.dart';

import '../models/news_item.dart';

class NewsService {
  final Dio _dio;
  final String baseUrl ='https://newsapi.org/v2' ;
  final String apiKey = '2331900ba9604bb79ac7c9943306ba6c' ;

  NewsService(this._dio);

  Future<List<NewsItem>> getHeadlinesNews(String category) async {
    final response = await _dio.get
      ('$baseUrl/top-headlines?country=us&apiKey=$apiKey&category=$category');

    if (response.statusCode == 200) {
      List articles = response.data['articles'];
      return articles.map((article) => NewsItem.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
