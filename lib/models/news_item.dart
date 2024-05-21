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
/*named constructor*/
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
