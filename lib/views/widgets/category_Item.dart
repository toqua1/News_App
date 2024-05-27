import 'package:flutter/material.dart';
import 'package:news_app/views/screens/category_page.dart';
import 'package:shimmer/shimmer.dart';
import '../../models/category_model.dart';
import 'build_shimmer_category_Item.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    Future<void> loadImage(String imagePath) async{
      await precacheImage(AssetImage(imagePath), context);
    }
    return FutureBuilder(
      future: loadImage(category.img),
      builder: (BuildContext context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                      CategoryPage(categoryName: category.categoryName))
              );
            },
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(category.img),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  category.categoryName,
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Montserrat bold'
                  ),
                ),
              ],
            ),
          );
        }else{
          return buildShimmerCategItem(context);
        }
      }
    );
  }
}
