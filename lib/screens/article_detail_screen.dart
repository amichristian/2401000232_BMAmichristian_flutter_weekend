import 'package:flutter/material.dart';

import '../models/news_article.dart';

class ArticleDetailScreen extends StatelessWidget {
  final NewsArticle article;

  const ArticleDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Article Details')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: article.id,
                child: Image.network(
                  article.imageUrl,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 250,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text('Image could not be loaded'),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              Text(
                article.title,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                article.source,
                style: TextStyle(fontSize: 15, color: Colors.grey[700]),
              ),

              const SizedBox(height: 20),

              Text(
                article.description,
                style: const TextStyle(fontSize: 18, height: 1.5),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back to News'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
