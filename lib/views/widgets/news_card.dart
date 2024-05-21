// import 'package:flutter/material.dart';
//
// class NewsCard extends StatelessWidget {
//   final String title;
//   final String desc;
//   final String img;
//
//   NewsCard({
//     required this.title,
//     required this.desc,
//     required this.img,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 30 ,vertical: 10),
//       child: ListTile(
//         contentPadding: EdgeInsets.all(10.0),
//         leading: Image.asset(img, width: 90, fit: BoxFit.cover),
//         title: Text(title,style: const TextStyle(
//             fontSize: 16.0,
//             fontFamily: 'Montserrat bold'
//         ),),
//         subtitle: Text(desc, style: const TextStyle(
//           fontFamily: 'Metropolis thin',
//           overflow: TextOverflow.ellipsis
//         ),),
//         onTap: () {
//
//         },
//       ),
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/screens/news_details_page.dart';

import '../../models/news_item.dart';

class NewsCard extends StatelessWidget {
  final NewsItem newsItem ;
  NewsCard({super.key,
   required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=> NewsDetailsPage
              (newsItem:newsItem ))
        );
      },
      child: SizedBox(
        height: 190,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40)
          ),
          elevation: 10,
          margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 90,
                  child:CachedNetworkImage(
                    imageUrl: newsItem.imgUrl ?? '' ,width:90, fit:BoxFit.cover
                    ,placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Image.asset
                      ('assets_NewsApp/boarding1.jpg',width:90, fit:BoxFit.cover),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsItem.title!,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Montserrat bold',
                            overflow: TextOverflow.ellipsis
                          ),
                          maxLines: 5,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          newsItem.content ?? newsItem.description ??'',
                          maxLines: 2,
                          style: const TextStyle(
                            fontFamily: 'Metropolis thin',
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w600,
                            fontSize: 13
                            // color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
