import '../domain/article_item.dart';

class ArticleResponse extends ArticleItem {
  ArticleResponse(
      {super.author,
      super.title,
      super.description,
      super.url,
      super.urlToImage,
      super.publishedAt,
      super.content});

  // final String author;
  // final String title;
  // final String description;
  // final String url;
  // String urlToImage;
  // final String publishedAt;
  // final String content;

  factory ArticleResponse.fromJson(Map<String, dynamic> json) {
    return ArticleResponse(
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}
