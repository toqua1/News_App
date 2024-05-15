class CategoryModel{

 final String img;
 final String categoryName ;

  CategoryModel({
    required this.categoryName,
    required this.img,
});
 final List<CategoryModel> categories=[
    CategoryModel(categoryName: 'Business', img:'assets_NewsApp/google.png' ),
    CategoryModel(categoryName: 'Sports', img: 'assets_NewsApp/google.png'),
    CategoryModel(categoryName: 'Art', img: 'assets_NewsApp/google.png'),
    CategoryModel(categoryName: 'Politics', img: 'assets_NewsApp/google.png'),
  ];
}