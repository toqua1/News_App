import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../models/news_item.dart';

class NewDetailsBody extends StatelessWidget{
  final NewsItem newsItem;
  const NewDetailsBody({super.key,required this.newsItem});
  @override
  Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
            children:[
              Row(
                  children:[
                    CircleAvatar(
                      child: Center(
                        child: Text(newsItem.sourceName![0],style: const TextStyle(
                            fontFamily: 'Metropolis extraBold',
                        ),),
                      ),
                    ),
                    const SizedBox(width:8.0),
                    Text(
                        newsItem.sourceName!, style: Theme.of(context).textTheme
                        .titleMedium!.copyWith(
                      fontFamily: 'Montserrat bold'
                    )
                    )
                  ]    ),
              const SizedBox(height:16.0),
              Text(newsItem.content ?? newsItem.description ??"There is no content "
                  "yet"
                  ,style:Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: 'Metropolis thin',
                    fontSize: 15,
                    letterSpacing: 2 ,
                    fontWeight: FontWeight.w900,
                    wordSpacing: 5
                  ))
            ]

        ));
  }
}