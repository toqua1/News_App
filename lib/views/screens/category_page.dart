import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/widgets/build_shimmer_recommend.dart';
import 'package:news_app/views/widgets/build_shimmer_slider.dart';
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
          return Scaffold(body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50 ,vertical:
                130),
                child: buildShimmerRecommed(),
              )
          ));
        }
      },
    );
  }
}
