import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resource/RoutesManager.dart';
import 'package:news_app/ui/screens/home/articles/article_widget.dart';
import 'package:news_app/ui/screens/home/category/category_item.dart';
import 'package:news_app/ui/screens/home/home_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,

      builder: (context , child) =>
          MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: RoutesManager.home,
        routes:{
          RoutesManager.home : (context) => HomeScreen(),
        } ,
        home: HomeScreen(),

      )

    );

  }
}


