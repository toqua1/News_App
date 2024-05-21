
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/news_item.dart';
//
// List<Widget> buildImageSliders(BuildContext context, List<NewsItem> news) {
//   return news.map((item) => Container(
//     margin: const EdgeInsets.all(5.0),
//     child: ClipRRect(
//       borderRadius: const BorderRadius.all(Radius.circular(24.0)),
//       child: Stack(
//         children: <Widget>[
//           Image.network(item.imgUrl!, fit: BoxFit.cover, width: 1000.0),
//           Positioned(
//             top: 10,
//             left: 20,
//             child: DecoratedBox(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).primaryColor,
//                 borderRadius: BorderRadius.circular(16.0),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   item.category!,
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0.0,
//             left: 0.0,
//             right: 0.0,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Text(
//                     '${item.author} • ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime
//                       .parse(item.publishedAt!))}',
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 Container(
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Color.fromARGB(200, 0, 0, 0),
//                         Color.fromARGB(0, 0, 0, 0),
//                       ],
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                     ),
//                   ),
//                   padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                   child: Text(
//                     item.title!,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   )).toList();
// }

List<Widget> buildImageSliders(BuildContext context, List<NewsItem> news) {
  return news.map((item) => Container(
    margin: const EdgeInsets.all(5.0),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(24.0)),
      child: Stack(
        children: <Widget>[
          // Image.network(item.imgUrl ?? '', fit: BoxFit.cover, width: 1000.0),
          CachedNetworkImage(
            imageUrl: item.imgUrl ?? '',
            fit: BoxFit.cover,
          width: 1000.0 ,
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Image.asset
              ('assets_NewsApp/boarding1.jpg',fit: BoxFit.cover,
              width: 1000.0 ,),
          ),
          Positioned(
            top: 10,
            left: 20,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.sourceName ?? 'Unknown Source',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14 ,
                      fontFamily: 'Metropolis thin',
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    '${item.author ?? 'Unknown Author'} • ${DateFormat('kk:mm').format(DateTime.parse(item.publishedAt ?? DateTime.now().toString()))}',
                    style: const TextStyle(
                        color: Colors.white
                        ,fontSize: 10 ,
                        fontFamily: 'Metropolis thin',
                      fontWeight: FontWeight.w900
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    item.title ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontFamily: 'Metropolis extraBold'
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  )).toList();
}
