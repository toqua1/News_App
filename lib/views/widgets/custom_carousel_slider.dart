import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_item.dart';
import 'package:news_app/views/widgets/build_image_slider.dart';
import '../../services/news_service.dart';
//
// class CustomCarouselSlider extends StatefulWidget{
//
//   const CustomCarouselSlider({super.key});
//   @override
//   State<CustomCarouselSlider> createState()=> _CustomCarouselSliderState();
// }
//
// class _CustomCarouselSliderState extends State<CustomCarouselSlider>{
//   final _controller = CarouselController();
//   int _current= 0;
//  late Future<List<NewsItem>> future ;
//   @override
//   void initState() {
//     super.initState();
//     future=NewsService(Dio()).getHeadlinesNews('general');
//   }
//
//   @override
//   Widget build(BuildContext context){
//     return  FutureBuilder(
//       future: future,
//       builder: (BuildContext context,snapshot) {
//         if(snapshot.hasData) {
//           final List<Widget> imageSliders = buildImageSliders(context, snapshot.data!);
//           return Column(
//               children: [
//                 CarouselSlider(
//                   items: imageSliders,
//                   carouselController: _controller,
//                   options: CarouselOptions(
//                       autoPlay: true,
//                       enlargeCenterPage: true,
//                       aspectRatio: 2.0,
//                       onPageChanged: (index, reason) {
//                         setState(() {
//                           _current = index;
//                         });
//                       }),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: snapshot.data!
//                       .asMap()
//                       .entries
//                       .map((entry) {
//                     return GestureDetector(
//                         onTap: () => _controller.animateToPage(entry.key),
//                         child: Container(
//                           width: _current == entry.key ? 25.0 : 12.0,
//                           height: 12.0,
//                           margin: const EdgeInsets.symmetric(
//                               vertical: 8.0, horizontal: 4.0),
//                           decoration: BoxDecoration(
//                               borderRadius: _current == entry.key ? BorderRadius
//                                   .circular(8.0) : null,
//                               shape: _current == entry.key
//                                   ? BoxShape.rectangle
//                                   : BoxShape.circle,
//                               color: _current == entry.key ? Theme
//                                   .of(context)
//                                   .primaryColor : Colors.grey.withOpacity(0.2)
//                           ),
//                         ));
//                   }).toList(),
//
//                 )
//               ]
//           );
//         }else if(snapshot.hasError){
//           return const Center(
//             child: Text('Oops, There was an error, try later' ,style:TextStyle(
//               fontSize: 25,
//               fontFamily: 'Montserrat bold'
//             ),),
//           );
//         }else{
//           return const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }
class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  late Future<List<NewsItem>> future;

  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getHeadlinesNews('general');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          final List<Widget> imageSliders = buildImageSliders(context, snapshot.data!);
          return Column(
            children: [
              CarouselSlider(
                items: imageSliders.sublist(0,6),
                carouselController: _controller,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageSliders.sublist(0, 6)
                // snapshot.data!
                    .asMap()
                    .entries
                    .map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: _current == entry.key ? 25.0 : 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        borderRadius: _current == entry.key ? BorderRadius.circular(8.0) : null,
                        shape: _current == entry.key ? BoxShape.rectangle : BoxShape.circle,
                        color: _current == entry.key ? Theme.of(context).primaryColor : Colors.grey.withOpacity(0.2),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Oops, There was an error, try later',
              style: TextStyle(fontSize: 25, fontFamily: 'Montserrat bold'),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
