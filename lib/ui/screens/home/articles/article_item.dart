import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../core/remote/Articles/Articles.dart';

class ArticleItem extends StatelessWidget {
  final Article article;

  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:REdgeInsets.all(8.r),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: article.urlToImage ?? "",
            height: 220.h,
            width: 345.w,
            fit: BoxFit.fill,
            placeholder: (context, url) => Center(child: const CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
           SizedBox(height: 10.h),
          Text(article.title ?? "",
              style:  TextStyle(fontSize:16.sp,
              fontWeight: FontWeight.bold,
              )),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text("By : ${article.author} "?? "",style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  color: Colors.grey,
                )),
              ),
              Text(timeago.format(DateTime.parse(article.publishedAt??"")),style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey
              )),
            ],
          )
        ],
      ),
    );
  }
}
