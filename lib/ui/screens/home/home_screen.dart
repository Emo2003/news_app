import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/ui/screens/home/articles/article_widget.dart';
import 'package:news_app/ui/screens/home/category/category_item.dart';
import 'package:news_app/ui/screens/home/category/category_widget.dart';
import 'package:news_app/ui/screens/home/widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(selectedPage == null ? "Home" : selectedPage!,
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500
          ),),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_outlined, size: 30),
          ),
        ],
      ),
      drawer: DrawerWidget(
        selectedPage: selectedPage,
        goToHome: (){
        selectedPage=null;
        Navigator.pop(context);
        setState(() {
        });
      },),
      body:
      Padding(padding: const EdgeInsets.all(16.0),
          child:
        selectedPage==null?  CategoryItem(
        onCategoryClick: choosePage,):ArticleWidget(
          page: selectedPage!,
        )
      ),
    );
  }

  choosePage(String page) {
    selectedPage = page;
    setState(() {});
  }
}
