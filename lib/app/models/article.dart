class Article {
  const Article(
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  );

  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        json["author"] ?? '',
        json["title"] ?? '',
        json["description"] ?? '',
        json["url"] ?? '',
        json["urlToImage"] ?? '',
        DateTime.parse(json["publishedAt"] ?? DateTime.now()),
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
      };
}
