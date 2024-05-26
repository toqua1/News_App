import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../models/news_item.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../services/news_service.dart';
import '../screens/news_details_page.dart';
import 'build_shimmer_recommend.dart';

class RecommendationItem extends StatefulWidget{
  const RecommendationItem({super.key});

  @override
  State<RecommendationItem> createState() => _RecommendationItemState();
}

class _RecommendationItemState extends State<RecommendationItem> {
  late Future<List<NewsItem>> future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getHeadlinesNews('general');
  }
  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: future,
      builder: (BuildContext context,snapshot) {
        if(snapshot.hasData){
          return Column(
            children: [
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
                        , child:  SizedBox(
                      height: 160,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child:
                              CachedNetworkImage(
                                imageUrl: newsItem.imgUrl ?? '',
                                height: 150,
                                width: 125,
                                fit: BoxFit
                                    .cover
                                ,
                                placeholder: (context, url) =>
                                    Center(
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.grey.shade300,
                                          highlightColor: Colors.grey.shade100,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        )
                                    ),
                                errorWidget: (context, url, error) =>
                                    Image.asset
                                      ('assets_NewsApp/boarding1.jpg', height: 100,
                                        width: 140,
                                        fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('General', style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Metropolis thin'
                                    )),
                                    const SizedBox(height: 2.0),
                                    Text(newsItem.title!, style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                        fontFamily: 'Metropolis extraBold',
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 14
                                    ),
                                      maxLines: 5,
                                    ),
                                    const SizedBox(height: 5.0),
                                    Text('${newsItem.sourceName}•${DateFormat('kk:mm').format(DateTime
                                        .parse(newsItem.publishedAt!))}',
                                        style: Theme
                                            .of
                                          (context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                            color: Colors.grey,
                                            fontSize: 13,
                                            fontFamily: 'Metropolis thin',
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 2
                                        )),
                                  ]
                              ),
                            )
                          ]
                      ),
                    )
                  )),)
            ],
          );
        }else if(snapshot.hasError){
          return const Center(
            child: Text('Oops, There was an error, try later' ,style:TextStyle(
                fontSize: 25,
                fontFamily: 'Montserrat bold'
            ),),
          );
        }else{
          return buildShimmerRecommed();
        }
      }
    );
  }
}