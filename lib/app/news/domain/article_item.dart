import 'package:hive_flutter/hive_flutter.dart';

part 'article_item.g.dart';

@HiveType(typeId: 0)
class ArticleItem extends HiveObject {
  @HiveField(0)
  final String author;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String url;
  @HiveField(4)
  final String urlToImage;
  @HiveField(5)
  final String publishedAt;
  @HiveField(6)
  final String content;

  ArticleItem(
      {this.author = '',
      this.title = '',
      this.description = '',
      this.url = '',
      this.urlToImage = '',
      this.publishedAt = '',
      this.content = ''});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ArticleItem) return false;
    return other.author == author &&
        other.title == title &&
        other.description == description &&
        other.url == url &&
        other.urlToImage == urlToImage &&
        other.publishedAt == publishedAt &&
        other.content == content;
  }

  @override
  int get hashCode =>
      author.hashCode ^
      title.hashCode ^
      description.hashCode ^
      url.hashCode ^
      urlToImage.hashCode ^
      publishedAt.hashCode ^
      content.hashCode;
}
