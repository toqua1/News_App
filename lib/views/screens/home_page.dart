// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:news_app/utilities/images_slider.dart';
// import 'package:news_app/views/screens/auth_page.dart';
// import 'package:news_app/views/widgets/custom_app_bar.dart';
// import 'package:news_app/views/widgets/custom_carousel_slider.dart';
//
// bool signOut=false;
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions:[ IconButton(
//           icon: Icon(Icons.logout),
//           onPressed: ()async{
//             /*as i signed with google , i need also to sign out from it*/
//             GoogleSignIn googleSignIn=GoogleSignIn();
//             googleSignIn.disconnect();
//             /*change only status*/
//             await FirebaseAuth.instance.signOut();
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const AuthPage())
//             );
//           },
//         ),
//     ]
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
//             child: Column(
//               children: [
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CustomAppBar(icon: FontAwesomeIcons.barsStaggered,),
//                     Row(
//                       children: [
//                         CustomAppBar(icon: FontAwesomeIcons.magnifyingGlass,),
//                         SizedBox(width: 6,),
//                         CustomAppBar(icon:FontAwesomeIcons.bell),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Breaking News",style:
//                     Theme.of(context).textTheme.headlineSmall!.copyWith(
//                       fontFamily: 'Metropolis extraBold'
//                     )
//                       ,),
//                     Text('View all',
//                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                         color: Theme.of(context).primaryColor,
//                         fontWeight: FontWeight.w500
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16,),
//                 CustomCarouselSlider(imgList: imgList),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import '../../models/news_item.dart';
import '../widgets/app_bar_icon.dart';
import '../widgets/custom_carousel_slider.dart';
import '../widgets/home_title_widget.dart';
import '../widgets/recommendation_item.dart';
import 'news_details_page.dart';
class HomePage extends StatelessWidget{
  const HomePage({super.key});


  @override
  Widget build(BuildContext  context){
    return Scaffold(

        body: SingleChildScrollView(
          child : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical:32.0),
            child: Column(
                children:[
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppBarIcon(icon: Icons.menu),
                      Row(
                        children: [
                          AppBarIcon(icon: Icons.search),
                          SizedBox(width:6.0),
                          AppBarIcon(icon:Icons.notifications)
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height :16.0),
                  HomeTitleWidget(title: "Breaking News"),
                  const SizedBox(height:8.0),
                  CustomCarouselSlider(),
                  const SizedBox(height:16.0),
                  HomeTitleWidget(title: "Recommendation"),
                  const SizedBox(height:8.0),
                  ...news.map((newsItem)=> Padding(
                    padding: const EdgeInsets.only(bottom:16.0),
                    child: InkWell(
                        onTap: ()=>
                            Navigator.of(context,rootNavigator: true).push(CupertinoPageRoute(
                              builder: (_) => NewsDetailsPage(newsItem: newsItem),))
                        ,child: RecommendationItem(newsItem: newsItem)),
                  ) ).toList(),

                ]
            ),
          ),

        ));
  }
}