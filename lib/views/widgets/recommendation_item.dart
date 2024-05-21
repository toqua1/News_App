import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/news_item.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecommendationItem extends StatelessWidget{
  final NewsItem newsItem;
  const RecommendationItem({super.key,required this.newsItem});
  @override
  Widget build(BuildContext context){
    String formattedDate = DateFormat('kk:mm').format(DateTime
        .parse(newsItem.publishedAt!));
    return Container(
      height: 160,
      child: Row(
          crossAxisAlignment:CrossAxisAlignment.center,
          children:[
            ClipRRect(
              borderRadius:BorderRadius.circular(15.0),
              child:
              CachedNetworkImage(
              imageUrl: newsItem.imgUrl ?? '' ,height:150,width:125, fit:BoxFit
                  .cover
              ,placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Image.asset
                ('assets_NewsApp/boarding1.jpg',height:100,width:140,
                  fit:BoxFit.cover),
            ),
          ),
            const SizedBox(width:8.0),
            Expanded(
              child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children:[
                    Text('General',style:Theme.of(context).textTheme.bodyLarge!
                        .copyWith(
                        color:Colors.grey,
                      fontSize: 15 ,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Metropolis thin'
                    )),
                    const SizedBox(height:2.0),
                    Text(newsItem.title!, style: Theme.of(context).textTheme
                        .titleMedium!.copyWith(
                      fontFamily: 'Metropolis extraBold',
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14
                    ),
                      maxLines: 5,
                    ),
                    const SizedBox(height:5.0),
                    Text('${newsItem.sourceName}•$formattedDate',
                        style:Theme.of
                      (context).textTheme.bodyLarge!.copyWith(
                            color:Colors.grey,
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
    );
  }
}