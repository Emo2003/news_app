import 'package:flutter/material.dart';
import 'package:news_app/core/remote/Category/Sources.dart';
import 'package:news_app/ui/screens/home/articles/article_item.dart';
import 'package:news_app/ui/screens/home/articles/widgets/custom_bottom_sheet.dart';

import '../../../../core/remote/ApiManager.dart';
import '../../../../core/remote/Articles/ArticleResponse.dart';
import '../../../../core/remote/Articles/Articles.dart';
import '../articleDetails/DialogArticleChoose.dart';

class ArticleList extends StatefulWidget {
  final Source source;

  const ArticleList({super.key, required this.source});

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getArticle(widget.source.id ?? ""),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong"));
        }

        ArticleResponse? articlesResponse = snapshot.data;
        if (articlesResponse?.status == "error") {
          return Column(
            children: [
              Text(articlesResponse?.message ?? ""),
              ElevatedButton(onPressed: () {}, child: Text("Try Again")),
            ],
          );
        }
        List<Article> articleList = articlesResponse?.articles ?? [];
        return ListView.separated(
          itemCount: articleList.length,
          itemBuilder: (_, index) => GestureDetector(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (_) => CustomBottomSheet(
                  onPressed: () {
                    showArticleOptionsDialog(
                      context,
                      articleList[index]
                    );
                  },
                  article: articleList[index],
                ),
              );
            },
            child: ArticleItem(article: articleList[index]),
          ),
          separatorBuilder: (_, _) => SizedBox(height: 10),
        );
      },
    );
  }
}
