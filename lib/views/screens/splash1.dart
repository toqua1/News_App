import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/screens/bottom_navbar.dart';
import 'onboarding.dart';
import 'package:lottie/lottie.dart';

class splash1 extends StatefulWidget {
  const splash1({super.key});

  @override
  State<splash1> createState() => _splash1State();
}

class _splash1State extends State<splash1> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 6),
            ()=> Navigator.push(context,
            MaterialPageRoute(builder: (context)=>
            FirebaseAuth.instance.currentUser != null?
            const BottomNavbar():
            const onboarding())
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff62111e),
      body: Stack(
        children: [
          Lottie.network(
              'https://lottie.host/2cdaca9a-95d8-4eaf-9be0-7e28d7d8c8af/jj2AmHG3t7.json',
              fit: BoxFit.cover ,height: 300),
          Container(
            width: 1000,
            height: 2000,
            color: Colors.black.withOpacity(0.1),
          ),
          Center(child: Lottie.asset('assets_NewsApp/gif1.json' ,
              width: 300
          )),
        ],
      ), // ],
      // ),
    );
  }
}


// class splash2 extends StatefulWidget {
//   const splash2({super.key});
//
//   @override
//   State<splash2> createState() => _splash2State();
// }
//
// class _splash2State extends State<splash2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff62111e),
//       body: Stack(
//         children: [
//           Lottie.network(
//               'https://lottie.host/2cdaca9a-95d8-4eaf-9be0-7e28d7d8c8af/jj2AmHG3t7.json',
//               fit: BoxFit.cover ,height: 300),
//           Container(
//             width: 1000,
//             height: 2000,
//             color: Colors.black.withOpacity(0.1),
//           ),
//           Center(child: Lottie.asset('assets_NewsApp/gif1.json' ,
//             width: 300
//           )),
//         ],
//       ), // ],
//         // ),
//     );
//   }
// }

// child: Image.asset('assets_NewsApp/gif1.gif'),
// child: Text('News\n   Globe',style: TextStyle(
//   color: Colors.white,
//   letterSpacing: 5,
//   fontFamily: 'Montserrat bold',
//   fontSize: 65
// ),),


// Center(
//   child: Column(
//       children: [
//         const SizedBox(
//           height:200,
//         ),
//         // Image.asset("assetsEdited/logo2.png" ,),
//         const SizedBox(
//           height: 30,
//         ),
//         Text("News Cloud".toUpperCase(),
//           style: const TextStyle(
//             fontWeight: FontWeight.w900,fontSize: 50,
//           ),
//         ),
//         const SizedBox(
//           height: 80,
//         ),
//         Container(
//           width: 100,
//           height: 70,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle ,
//             // color:Color.fromRGBO(29,29,160,1) ,
//           ),
//           child:
//             // IconButton(
//             // onPressed:() async{
//             StreamBuilder<User?>(
//                 stream: FirebaseAuth.instance.userChanges(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     // While the authentication state is being checked, show the splash screen
//                     return const splash1();
//                   } else {
//                     return IconButton(
//                       icon: const Icon(Icons.arrow_circle_right ,size:
//                       60,),
//                       onPressed: (){
//                         snapshot.hasData?
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const BottomNavbar()
//                           ),
//                         ) :
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const onboarding()),
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//         ),
//       ],
//     ),
// ),
// );

//   if (snapshot.hasData) {
//     // If user is logged in, navigate to the Holding screen
//     return IconButton(
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const BottomNavbar()
//             ),
//         );
//       },
// icon: const Icon(Icons.arrow_circle_right, size: 60,),
//     );
//   } else {
//     // If user is not logged in, navigate to the Onboarding screen
//     return
//       IconButton(
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const onboarding()),
//         );
//       },
// icon: const Icon(Icons.arrow_circle_right,size: 60,)
//     );
//   }