import 'package:flutter/material.dart';
import 'package:user_articles/domain/models/article_model.dart';

class ArticleDetailsPage extends StatelessWidget {
  const ArticleDetailsPage({
    Key? key,
    required this.articleModel,
  }) : super(key: key);

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articleModel.title.toString()),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Image.network(articleModel.picture),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  color: Colors.black12,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(articleModel.content),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
