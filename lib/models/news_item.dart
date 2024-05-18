class NewsItem{
  final int id;
  final String title;
  final String imgUrl;
  final String category;
  final String time;
  final String author;

  NewsItem({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.category,
    required  this.author,
    this.time="8 minutes ago",} );

}
List<NewsItem> news = [
  NewsItem(id: 1, title: 'This is a freaking title here ', imgUrl: 'https://ichef.bbci.co.uk/images/ic/1024xn/p0hx91y8.jpg.webp', category: "Health", author: "CNN"),
  NewsItem(id: 2, title: 'This is a amazing title here ', imgUrl:  'https://ichef.bbci.co.uk/images/ic/1024xn/p0hv9rm0.jpg.webp', category: "Art", author: "BBC"),
  NewsItem(id: 3, title: 'This is a excellent title here ', imgUrl: 'https://ichef.bbci.co.uk/images/ic/1024xn/p0hqz8rz.jpg.webp', category: "Food", author: "National"),
  NewsItem(id: 4, title: 'This is a very good title here ', imgUrl: 'https://ichef.bbci.co.uk/images/ic/1024x576/p0hxc2x0.jpg.webp' ,category: "Scientific", author: "CNN"),

];