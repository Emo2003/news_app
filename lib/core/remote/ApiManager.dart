import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/core/remote/Category/CategoryResponse.dart';

import 'Articles/ArticleResponse.dart';

class ApiManager extends ChangeNotifier {
 static final dio = Dio(
     BaseOptions(
       sendTimeout: Duration(seconds: 3),
       receiveTimeout: Duration(seconds: 3),
       connectTimeout: Duration(seconds: 3),
      baseUrl: 'https://newsapi.org',
    )
  );

 static Future<CategoryResponse>getCategory(String category)async{
  final response= await dio.get('/v2/top-headlines/sources', queryParameters: {
    "apiKey":"09df6eb15d4644cf8354e07633f73146",
    "category":category
  });
  CategoryResponse categoryResponse = CategoryResponse.fromJson(response.data);
  return categoryResponse;

}
 static Future<ArticleResponse>getArticle(String source)async{
   final response= await dio.get('/v2/everything', queryParameters: {
     "apiKey":"09df6eb15d4644cf8354e07633f73146",
     "sources":source
   });
   ArticleResponse articleResponse = ArticleResponse.fromJson(response.data);
   return articleResponse;

 }
}