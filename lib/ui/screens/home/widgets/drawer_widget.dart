import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resource/RoutesManager.dart';

class DrawerWidget extends StatelessWidget {
  final String? selectedPage;
  final void Function() goToHome;
  const DrawerWidget({super.key, required this.goToHome, required this.selectedPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      decoration: BoxDecoration(
          color: Colors.black
      ),
      child: Column(
        children: [
          Container(
              color: Colors.white,
              height: 170.h,
              width: 300.w,
              child: Center(child: Text("News App",style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ), textAlign: TextAlign.center,)) ),
          SizedBox(height: 10.h,),
          Padding(
            padding:  REdgeInsets.all(8.r),
            child:selectedPage!=null? Row(
              children: [
                Icon(Icons.home_filled,size: 30.sp,color: Colors.white,),
                TextButton(
                  onPressed: (){
                    goToHome();
                  },
                  child: Text( "Go To Home",style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ) ),)
              ],
            ):null,
          )
        ],
      ),
    );
  }
}
