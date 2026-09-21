class NewsArticle {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String articleUrl;
  final String source;
  final DateTime publishedAt;

  NewsArticle({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.articleUrl,
    required this.source,
    required this.publishedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'articleUrl': articleUrl,
      'source': source,
      'publishedAt': publishedAt.toIso8601String(),
    };
  }

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      articleUrl: json['articleUrl'],
      source: json['source'],
      publishedAt: DateTime.parse(json['publishedAt']),
    );
  }
}
