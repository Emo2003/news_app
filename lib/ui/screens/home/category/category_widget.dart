import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resource/AssetsManager.dart';
import 'package:news_app/core/resource/RoutesManager.dart';

import '../../../../model/category_model.dart';

class CategoryWidget extends StatelessWidget {
  final int index;
  final Category category;
  final void Function(String) onCategoryClick;
  const CategoryWidget({
    super.key,
    required this.category,
    required this.index,
    required this.onCategoryClick,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: index.isOdd ? TextDirection.rtl : TextDirection.ltr,
      child: Container(
        height: 180.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          children: [
            Image.asset(
              category.imagePath,
              width: 170.w,
              height: 180.h,
              fit: BoxFit.fill,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  category.title,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onCategoryClick(category.title);
                  },
                  child: Container(
                    padding: REdgeInsetsDirectional.only(start: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(84.r),
                      color: Colors.white.withAlpha(150),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        CircleAvatar(
                          radius: 25.r,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
