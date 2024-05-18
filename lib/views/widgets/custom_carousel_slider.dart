// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import '../../utilities/text_slider.dart';
//
// class CustomCarouselSlider extends StatefulWidget {
//   const CustomCarouselSlider({super.key, required this.imgList});
//   final List<String> imgList ;
//
//   @override
//   State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
// }
//
// class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
//   final _controller =CarouselController();
//   int _current=0;
//   @override
//   Widget build(BuildContext context) {
//
//     final List<Widget> imageSliders = widget.imgList
//         .map((item) => Container(
//       margin: const EdgeInsets.all(5.0),
//           child: ClipRRect(
//               borderRadius: const BorderRadius.all(Radius.circular(16.0)),
//               child: Stack(
//                 children:[
//                   Image.asset(
//                       item,
//                       fit: BoxFit.cover,
//                       width: 1000,
//                     height: 2000,
//                   ),
//                   Container(
//                     width: 1000,
//                     height: 2000,
//                     color: Colors.black.withOpacity(0.2),
//                   ),
//                   Positioned(
//                     bottom: 5.0,
//                     left: 0.0,
//                     right: 0.0,
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             Color.fromARGB(200, 0, 0, 0),
//                             Color.fromARGB(0, 0, 0, 0)
//                           ],
//                           begin: Alignment.bottomCenter,
//                           end: Alignment.topCenter,
//                         ),
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 10.0, horizontal: 20.0),
//                       child: Text(
//                         textList[widget.imgList.indexOf(item)],
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 17.0,
//                           // fontWeight: FontWeight.bold,
//                           fontFamily: 'Montserrat bold'
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )),
//         ))
//         .toList();
//
//     return  Column(
//       children: [
//         CarouselSlider(
//             items: imageSliders,
//             carouselController: _controller,
//             options: CarouselOptions(
//                 autoPlay: true,
//                 enlargeCenterPage: true,
//                 aspectRatio: 1.6,
//                 onPageChanged: (index, reason) {
//                   setState(() {
//                     _current = index;
//                   });
//                 }),
//           ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: widget.imgList.asMap().entries.map((entry) {
//             return GestureDetector(
//               onTap: () => _controller.animateToPage(entry.key),
//               child: Container(
//                 width: 16.0,
//                 height: 12.0,
//                 margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: (Theme.of(context).primaryColor
//                     // brightness ==
//                     //     Brightness.dark
//                     //     ? Colors.white
//                     //     : Colors.black
//                     )
//                         .withOpacity(_current == entry.key ? 0.9 : 0.25)),
//               ),
//             );
//           }).toList(),
//         ),
//       ]
//     );
//   }
// }
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/news_item.dart';

class CustomCarouselSlider extends StatefulWidget{

  const CustomCarouselSlider({super.key});
  @override
  State<CustomCarouselSlider> createState()=> _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider>{
  final _controller = CarouselController();
  int _current= 0;
  @override
  Widget build(BuildContext context){
    final List<Widget> imageSliders = news
        .map((item) => Container(

      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item.imgUrl, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                top:10,
                left:20,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      color:Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child:  Padding (
                        padding:const EdgeInsets.all(8.0),
                        child:Text(item.category,style:TextStyle(
                            color:Colors.white
                        ))
                    )
                ),

              ),
              Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[ Padding(
                          padding:const EdgeInsets.symmetric (horizontal: 20.0),
                          child:Text('${item.author}• ${item.time} ',style:const TextStyle(
                            color:Colors.white,
                          )
                          )
                      ),Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding:const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          item.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                      ] )
              ),
            ],
          )),
    ))
        .toList();
    return  Column(
        children:[
          CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: news.asMap().entries.map((entry) {
              return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: _current == entry.key ? 25.0 : 12.0,
                    height: 12.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        borderRadius:_current == entry.key ?BorderRadius.circular(8.0):null,
                        shape:_current == entry.key ? BoxShape.rectangle:BoxShape.circle,
                        color: _current == entry.key? Theme.of(context).primaryColor:Colors.grey.withOpacity(0.2)
                    ),
                  ));
            }).toList(),

          )]
    );
  }
}