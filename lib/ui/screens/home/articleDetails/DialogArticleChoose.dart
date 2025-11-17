import 'package:flutter/material.dart';
import 'package:news_app/core/remote/ApiManager.dart';

import '../../../../core/remote/Articles/Articles.dart';

void showArticleOptionsDialog(BuildContext context, Article article) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('Open Article'),
      content: const Text('Choose how you want to open the article'),
      actions: [
        TextButton(
          onPressed: () {
            ApiManager.openInApp(article.url ?? "");
            Navigator.of(context).pop();
          },
          child: const Text('Inside App'),
        ),
        TextButton(
          onPressed: () {
            ApiManager.openInBrowser(article.url ?? "");
            Navigator.of(context).pop();
          },
          child: const Text('Browser'),
        ),
      ],
    ),
  );
}
