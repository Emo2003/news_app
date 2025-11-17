import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/remote/Articles/Articles.dart';

class CustomBottomSheet extends StatelessWidget {
  final Article article;
  final void Function()onPressed;

  const CustomBottomSheet({super.key,
    required this.article,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: REdgeInsets.all(20.r),
        padding: REdgeInsets.all(8.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.black
        ),
        height: 413.h,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(

                imageUrl: article.urlToImage ?? "",
                height: 220.h,
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 10.h,),
            Expanded(
              child: Text(
                article.title ?? "",
                style: TextStyle(fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 40.h),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                onPressed();
              },
              child: Text("View Full Article",
                  style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.w700,)),
            ),
          ],
        ),

    );
  }
}
