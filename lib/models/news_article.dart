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

  // Convert the NewsArticle object into JSON.
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

  // Create a NewsArticle object from JSON.
  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      articleUrl: json['articleUrl'] as String,
      source: json['source'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
    );
  }
}
