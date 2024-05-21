import 'package:flutter/material.dart';
import 'package:news_app/views/screens/category_page.dart';
import '../../models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context)=>
            CategoryPage(categoryName:  category.categoryName))
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
  }
}
