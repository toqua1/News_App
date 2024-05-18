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
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String desc;
  final String img;

  NewsCard({
    required this.title,
    required this.desc,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)
        ),
        elevation: 10,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 90,
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Montserrat bold',
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        desc,
                        maxLines: 2,
                        style: const TextStyle(
                          fontFamily: 'Metropolis thin',
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
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
    );
  }
}
