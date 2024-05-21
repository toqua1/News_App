import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import '../widgets/category_Item.dart';

class CategoriesGrid extends StatelessWidget {
   CategoriesGrid({super.key});

  final List<CategoryModel> categories=[
    CategoryModel(categoryName: 'Business', img:'assets_NewsApp/business1.jpg' ),
    CategoryModel(categoryName: 'Sports', img: 'assets_NewsApp/sports1.jpg'),
    CategoryModel(categoryName: 'Art', img: 'assets_NewsApp/arts1.jpg'),
    CategoryModel(categoryName: 'Politics', img: 'assets_NewsApp/politics1.jpg'),
    CategoryModel(categoryName: 'Entertainment', img: 'assets_NewsApp/entertainment1.jpg'),
    CategoryModel(categoryName: 'Health', img: 'assets_NewsApp/health1.jpg'),
    CategoryModel(categoryName: 'General', img: 'assets_NewsApp/general1.jpg'),
    CategoryModel(categoryName: 'Science', img: 'assets_NewsApp/science.jpg'),
    CategoryModel(categoryName: 'Technology', img: 'assets_NewsApp/tech1.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Scaffold(
        // backgroundColor: const Color(0xffe5e5e5),
        appBar: AppBar(
          title: const Text('News Categories' ,style: TextStyle(
            fontFamily: 'Metropolis extraBold'
          ),),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return CategoryItem(category: categories[index]);
            },
          ),
        ),
      ),
    );
  }
}
