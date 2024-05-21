import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../models/news_item.dart';
import '../../services/news_service.dart';
import '../widgets/news_card.dart';

class CategoryPage extends StatefulWidget {
  final String categoryName;

  CategoryPage({required this.categoryName});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late Future<List<NewsItem>> future ;
  @override
  void initState() {
    super.initState();
    future=NewsService(Dio()).getHeadlinesNews(widget.categoryName.toLowerCase());
  }
  // final List<Map<String, String>> newsItems = [
    // {
  //     'title': 'The UNESCO World Heritage site with sky-high house prices',
  //     'img': 'assets_NewsApp/img7.jpg',
  //     'desc': 'The historic city, known for its stunning architecture, now faces soaring property prices. Residents are concerned about the impact on the local community.'
  //   },
  //   {
  //     'title': 'How do politicians around the world stay safe',
  //     'img': 'assets_NewsApp/img2.jpg',
  //     'desc': 'Politicians globally adopt various measures for security, from bodyguards to high-tech surveillance. These efforts highlight the increasing threats they face.'
  //   },
  //   {
  //     'title': 'Why Brexit still has a Northern Ireland problem',
  //     'img': 'assets_NewsApp/boarding1.jpg',
  //     'desc': 'Brexit continues to cause tensions in Northern Ireland, with trade issues and political disagreements. The region remains a critical point of contention.'
  //   },
  //   {
  //     'title': 'Peak oil is coming. That won’t save the world',
  //     'img': 'assets_NewsApp/general1.jpg',
  //     'desc': 'As global oil production peaks, experts warn that this won’t be enough to address climate change. Transitioning to renewable energy remains crucial.'
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, snapshot) {
        if(snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.categoryName, style: const TextStyle(
                        fontFamily: 'Metropolis extraBold',
                        fontSize: 25
                    ),),
                    Text('${snapshot.data!.length.toString()} Articls',
                      style: const TextStyle(
                          fontFamily: 'Metropolis thin',
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),),
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index)  {
                   return NewsCard(newsItem: snapshot.data![index]);
                  // return NewsCard(
                  //   title: newsItems[index]['title']!,
                  //   desc: newsItems[index]['desc']!,
                  //   img: newsItems[index]['img']!,
                  // );
                },
              ),
            ),
          );
        }else if(snapshot.hasError){
          return const Scaffold( 
            body:  Center(
            child: Text('Oops, There was an error, try later' ,style:TextStyle(
                fontSize: 25,
                fontFamily: 'Montserrat bold'
            ),),
          ),);
        }else{
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
