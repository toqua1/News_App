// class NewsItem{
//   final String? title;
//   final String? content;
//    String? imgUrl='assets_NewsApp/sports1.jpg';
//   final String? category;
//   final String? publishedAt;
//   final String? author;
//   final String? source;
//   final String? desc ;/*if content is null , put it instead of content */
//
//   NewsItem({
//     required this.source,
//     required this.content,
//     required this.title,
//     required this.imgUrl,
//     required this.category,
//     required  this.author,
//     required this.publishedAt,
//     this.desc
//   } );
//
// }
class NewsItem {
  final String? sourceName;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? imgUrl;
  final String? publishedAt;
  final String? content;

  NewsItem({
    this.sourceName,
    this.author,
    this.title,
    this.description,
    this.url,
    this.imgUrl,
    this.publishedAt,
    this.content,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      sourceName: json['source']['name'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      imgUrl: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
