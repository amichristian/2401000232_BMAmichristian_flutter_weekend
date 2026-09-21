import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/news_article.dart';

class NewsNotifier extends Notifier<List<NewsArticle>> {
  @override
  List<NewsArticle> build() {
    return [
      NewsArticle(
        id: '1',
        title: 'Technology is changing the way we live',
        description: 'New technologies are helping people communicate, learn, and work more efficiently.',
        imageUrl: 'https://picsum.photos/seed/technology/800/500',
        articleUrl: 'https://www.bbc.com/news/technology',
        source: 'BBC Technology',
        publishedAt: DateTime.now(),
      ),
      NewsArticle(
        id: '2',
        title: 'New developments in African technology',
        description: 'Technology continues to create new opportunities for businesses and communities across Africa.',
        imageUrl: 'https://picsum.photos/seed/africa/800/500',
        articleUrl: 'https://www.bbc.com/news/world/africa',
        source: 'BBC Africa',
        publishedAt: DateTime.now(),
      ),
      NewsArticle(
        id: '3',
        title: 'Digital education continues to grow',
        description: 'Students are increasingly using digital tools to access educational resources.',
        imageUrl: 'https://picsum.photos/seed/education/800/500',
        articleUrl: 'https://www.unesco.org/en/education',
        source: 'UNESCO',
        publishedAt: DateTime.now(),
      ),
    ];
  }

  void addArticle(NewsArticle article) {
    state = [...state, article];
  }

  void removeArticle(String id) {
    state = state.where((article) => article.id != id).toList();
  }

  void clearArticles() {
    state = [];
  }
}

final newsProvider = NotifierProvider<NewsNotifier, List<NewsArticle>>(
  NewsNotifier.new,
);
