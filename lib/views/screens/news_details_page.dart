import 'package:flutter/material.dart';
import '../../models/news_item.dart';
import '../widgets/new_details_body.dart';
import '../widgets/news_details_app_bar.dart';

class NewsDetailsPage extends StatelessWidget{
  final NewsItem newsItem;
  const NewsDetailsPage({super.key,required this.newsItem});
  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body:Stack(
            children:[
              Positioned.fill(
                child: CustomScrollView(
                    slivers:[
                      NewsDetailsAppBar(newsItem:newsItem),
                      SliverToBoxAdapter(
                          child:NewDetailsBody(newsItem: newsItem,)
                      )
                    ]
                ),
              ),
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: size.width,
                  height: size.height * 0.25,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [
                          Colors.white,
                          Colors.white.withOpacity(0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]
        )
    );
  }
}