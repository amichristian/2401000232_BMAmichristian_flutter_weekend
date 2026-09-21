import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/news_article.dart';

class WebViewScreen extends StatefulWidget {
  final NewsArticle article;

  const WebViewScreen({super.key, required this.article});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller;

  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              isLoading = true;
              hasError = false;
            });
          },
          onPageFinished: (url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (error) {
            setState(() {
              isLoading = false;
              hasError = true;
            });

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to load the article.')),
            );
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.article.articleUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.article.source)),
      body: Stack(
        children: [
          if (!hasError) WebViewWidget(controller: controller),

          if (isLoading) const Center(child: CircularProgressIndicator()),

          if (hasError)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Unable to load this article.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          hasError = false;
                          isLoading = true;
                        });

                        controller.reload();
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
