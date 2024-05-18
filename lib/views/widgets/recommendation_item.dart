import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/news_item.dart';
class RecommendationItem extends StatelessWidget{
  final NewsItem newsItem;
  const RecommendationItem({super.key,required this.newsItem});
  @override
  Widget build(BuildContext context){
    return Row(
        crossAxisAlignment:CrossAxisAlignment.start,
        children:[ClipRRect(

            borderRadius:BorderRadius.circular(16.0),
            child: Image.network(newsItem.imgUrl,height:100,
                width:155, fit:BoxFit.cover)),
          const SizedBox(width:8.0),
          Expanded(
            child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                  Text(newsItem.category,style:Theme.of(context).textTheme.bodyLarge!.copyWith(color:Colors.grey)),
                  const SizedBox(height:2.0),
                  Text(newsItem.title, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height:1.0),
                  Text('${newsItem.author}•${newsItem.time} ',style:Theme.of(context).textTheme.bodyLarge!.copyWith(color:Colors.grey)),

                ]
            ),
          )
        ]
    );
  }
}