import 'package:flutter/material.dart';
import 'package:news_app/core/remote/ApiManager.dart';
import 'package:news_app/core/remote/Articles/Articles.dart';
import 'package:news_app/ui/screens/home/search/widgets/custom_text_field.dart';

import '../articleDetails/DialogArticleChoose.dart';
import '../articles/article_item.dart';
import '../articles/widgets/custom_bottom_sheet.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  Future<List<Article>>? _searchFuture;

  void _onSearchChanged(String query) {
    if (query.isEmpty) {
      setState(() => _searchFuture = null);
      return;
    }
    setState(() {
      _searchFuture = ApiManager.searchArticles(query)
          .then((response) => response.articles ?? []);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: CustomTextField(
                onChanged: _onSearchChanged,
               controller: _controller,
               onPressed: (){
                 _controller.clear();
                 _onSearchChanged('');
               },
              ),
            ),
            Expanded(
              child: _searchFuture == null
                  ? const Center(child: Text("Type to search articles"))
                  : FutureBuilder<List<Article>>(
                future: _searchFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Error fetching articles"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No results found"));
                  }

                  final articles = snapshot.data!;
                  return ListView.separated(
                    itemCount: articles.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final article = articles[index];

                      return GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) => CustomBottomSheet(
                              onPressed: () {
                                showArticleOptionsDialog(
                                  context,
                                  article,
                                );
                              },
                              article: article,
                            ),
                          );
                        },
                        child: ArticleItem(article: article),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
