import 'package:flutter/material.dart';

import '../../../../model/category_model.dart';
import 'category_widget.dart';

class CategoryItem extends StatelessWidget {
  final void Function(String) onCategoryClick;
  const CategoryItem({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Good Morning \nHere is Some News For You",
          style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),),
        SizedBox(height: 20,),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_,index)=>CategoryWidget(
              onCategoryClick: onCategoryClick,
                index: index,
                category:Category.categories[index]),
            separatorBuilder: (_,_)=>SizedBox(height: 10,),
            itemCount: Category.categories.length,
          ),
        )
      ],
    );
  }
}
