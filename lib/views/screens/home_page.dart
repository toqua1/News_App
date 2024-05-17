import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/utilities/images_slider.dart';
import 'package:news_app/views/widgets/custom_app_bar.dart';
import 'package:news_app/views/widgets/custom_carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomAppBar(icon: FontAwesomeIcons.barsStaggered,),
                    Row(
                      children: [
                        CustomAppBar(icon: FontAwesomeIcons.magnifyingGlass,),
                        SizedBox(width: 6,),
                        CustomAppBar(icon:FontAwesomeIcons.bell),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Breaking News",style:
                    Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontFamily: 'Metropolis extraBold'
                    )
                      ,),
                    Text('View all',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                CustomCarouselSlider(imgList: imgList),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
