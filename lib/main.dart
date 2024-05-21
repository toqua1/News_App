import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/views/screens/bottom_navbar.dart';
import 'package:news_app/views/screens/home_page.dart';
import 'package:news_app/views/screens/splash1.dart';
import 'firebase/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // NewsService(Dio()).getHeadlinesNews()
  ;/*all is anonymous method*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier=ValueNotifier(ThemeMode.dark) ;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
       return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
            // scaffoldBackgroundColor:const Color(0xffe5e5e5),
            primaryColor: const Color(0xffff404c)
            , inputDecorationTheme: InputDecorationTheme(
            labelStyle: Theme
                .of(context)
                .textTheme
                .titleMedium,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                    color: Colors.grey
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                    color: Colors.grey
                )
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                    color: Colors.red
                )
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                    color: Colors.red
                )
            ),
          ),
            useMaterial3: true,
          ),
         darkTheme: ThemeData.dark().copyWith(
           colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffff404c)),
           scaffoldBackgroundColor: Color(0xff102041),
           primaryColor: const Color(0xffff404c)
           , inputDecorationTheme: InputDecorationTheme(
           labelStyle: Theme
               .of(context)
               .textTheme
               .titleMedium,
           focusedBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(12),
               borderSide: const BorderSide(
                   color: Colors.grey
               )
           ),
           enabledBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(12),
               borderSide: const BorderSide(
                   color: Colors.grey
               )
           ),
           errorBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(12),
               borderSide: const BorderSide(
                   color: Colors.red
               )
           ),
           focusedErrorBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(12),
               borderSide: const BorderSide(
                   color: Colors.red
               )
           ),
         ),
           // navigationBarTheme:const NavigationBarThemeData(
           //   backgroundColor: Color(0xff305599)
           // )
           appBarTheme: const AppBarTheme(
             backgroundColor: Color(0xff102041),
             titleTextStyle: TextStyle(
               color: Colors.white,
                 fontFamily: 'Metropolis extraBold',
               fontSize: 22
             ),
             iconTheme: IconThemeData(
               color: Colors.white,
             ),
           ),
           cardTheme: const CardTheme(
             color: Color(0xff1b325b),
             elevation: 30
           )
         ),
         themeMode: currentMode,
          home: const splash1(),
        );
      }
    );
  }
}
