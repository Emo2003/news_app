import 'package:flutter/material.dart';

import '../../../../core/remote/ApiManager.dart';
import '../../../../core/remote/Category/CategoryResponse.dart';
import '../../../../core/remote/Category/Sources.dart';
import 'article_list.dart';
class ArticleWidget extends StatefulWidget {
 final String? page;
  const ArticleWidget({super.key , required this.page});

  @override
  State<ArticleWidget> createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getCategory(widget.page??""),
      builder: ( context,  snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Center(child: Text("Something went wrong"));
          }

          CategoryResponse? categoriesResponse = snapshot.data;
          if(categoriesResponse?.status=="error"){
            return Column(
              children: [
                Text(categoriesResponse?.message??""),
                ElevatedButton(onPressed: (){}, child: Text("Try Again"))
              ],
            );
          }
          List<Source> sourcesList = categoriesResponse?.sources??[];
          return  DefaultTabController(
            length: sourcesList.length,
            child: Column(
              children: [
                TabBar(
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 2,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: sourcesList.map((source) => Tab(
                   text: source.name,
                   )).toList(),
                ),
                Expanded(child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children:sourcesList.map((source)=>ArticleList(source: source,)).toList()
                ))
              ],
            ),
          );
      },

    );
  }
}
