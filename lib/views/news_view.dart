import 'package:flutter/material.dart';
import '../controllers/news_controller.dart';
import '../models/news_model.dart';

class HomeNewsAPI extends StatefulWidget {
  const HomeNewsAPI({super.key});

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<HomeNewsAPI> {
  List<NewsModel> newsArticles = [];
  final NewsController _controller = NewsController();

  @override
  void initState() {
    super.initState();
    _controller.fetchNews().then((articles) {
      setState(() {
        newsArticles = articles;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text('Notícias do dia'),
      ),
      body: newsArticles.isEmpty
          ? const Center(child: Text('Nenhuma notícia disponível no momento.'))
          : ListView.builder(
              itemCount: newsArticles.length,
              itemBuilder: (context, index) {
                final article = newsArticles[index];
                return Card(
                  color: Colors.blue[200],
                  margin: const EdgeInsets.all(5),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    title: Text(article.title),
                    subtitle: Text(
                      article.description,
                      style: const TextStyle(fontSize: 12),
                    ),
                    leading: article.urlToImage.isNotEmpty
                        ? Image.network(
                            article.urlToImage,
                            width: 100,
                            height: 50,
                          )
                        : null,
                  ),
                );
              },
            ),
    );
  }
}
