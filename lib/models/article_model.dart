class ArticleModel{

 final String? img;/*image may return null*/
 final String title ;/*each article has its title and if not => what is it doing here !!*/
 final String? subtitle;
 /*
 we make it final as the value that will be put to it
  ,will not be changed
  */

  ArticleModel({
    required this.img,
    required this.title,
    required this.subtitle

});
}