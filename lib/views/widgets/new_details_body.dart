import 'package:flutter/material.dart';
import '../../models/news_item.dart';

class NewDetailsBody extends StatelessWidget{
  final NewsItem newsItem;
  const NewDetailsBody({super.key,required this.newsItem});
  @override
  Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
            children:[
              Row(
                  children:[CircleAvatar(
                    backgroundImage: NetworkImage(newsItem.imgUrl),
                  ),
                    const SizedBox(width:8.0),
                    Text(
                        newsItem.author, style: Theme.of(context).textTheme.titleMedium
                    )
                  ]    ),
              const SizedBox(height:16.0),
              Text("lorem ipsum abcde abcde abde lorem ipsum abcde abcde abde lorem ipsum abcde abcde abde"
                  ,style:Theme.of(context).textTheme.bodyLarge)
            ]

        ));
  }
}