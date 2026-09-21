import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/news_article.dart';
import '../providers/news_provider.dart';
import 'article_detail_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final articles = ref.watch(newsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple News Reader'),
        centerTitle: true,
      ),
      body: articles.isEmpty
          ? const Center(
              child: Text(
                'No news articles available.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final NewsArticle article = articles[index];

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ArticleDetailScreen(article: article),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: article.id,
                            child: Image.network(
                              article.imageUrl,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 200,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Image could not be loaded',
                                  ),
                                );
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.title,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  article.source,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),

                                const SizedBox(height: 8),

                                AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  opacity: isExpanded ? 1.0 : 0.7,
                                  child: Text(
                                    article.description,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
