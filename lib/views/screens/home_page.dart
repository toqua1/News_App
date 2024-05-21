import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import 'package:news_app/models/news_item.dart';
import 'package:news_app/services/news_service.dart';
import '../widgets/app_bar_icon.dart';
import '../widgets/custom_carousel_slider.dart';
import '../widgets/home_title_widget.dart';
import '../widgets/recommendation_item.dart';
import 'news_details_page.dart';
class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

 late Future<List<NewsItem>> future ;

 @override
 void initState() {
    super.initState();
    future=NewsService(Dio()).getHeadlinesNews('general');
  }
  @override
  Widget build(BuildContext  context){
    return Scaffold(
        body: FutureBuilder(
          future: future,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 45.0),
                  child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppBarIcon(icon: Icons.menu),
                            Row(
                              children: [
                                AppBarIcon(icon: Icons.search),
                                SizedBox(width: 6.0),
                                AppBarIcon(icon: Icons.notifications)
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        const HomeTitleWidget(title: "Breaking News"),
                        const SizedBox(height: 8.0),
                        const CustomCarouselSlider(),
                        const SizedBox(height: 16.0),
                        const HomeTitleWidget(title: "Recommendation"),
                        const SizedBox(height: 8.0),
                        ...snapshot.data!.map((newsItem) =>
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: InkWell(
                                  onTap: () =>
                                      Navigator.of(context, rootNavigator: true)
                                          .push(CupertinoPageRoute(
                                        builder: (_) =>
                                            NewsDetailsPage(
                                                newsItem: newsItem),))
                                  , child: RecommendationItem(
                                  newsItem: newsItem
                              )),
                            )),

                      ]
                  ),
                ),

              );
            }else if(snapshot.hasError){
              return const Center(
                child: Text('Oops, There was an error, try later' ,style:TextStyle(
                    fontSize: 25,
                    fontFamily: 'Montserrat bold'
                ),),
              );
            }else{
              return const Center(child: CircularProgressIndicator());
            }
          }
        ));
  }
}