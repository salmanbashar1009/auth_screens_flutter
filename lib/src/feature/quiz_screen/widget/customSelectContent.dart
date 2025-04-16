import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomselectContent extends StatelessWidget {
  final String text;
  const CustomselectContent({super.key,
  
  required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    width: 326.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      color: Color(0xffF6F8FA)
    ),
    child: Padding(
      padding:  EdgeInsets.only(left:16.w, right: 16.w, top: 12.h,bottom: 12.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(text,
             style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                 
                ),
            
            
            )),
            SizedBox(height: 16.h,),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  
                },
                child: Image.asset("assets/images/quizscreen/dotbutt.png",
                height: 32.h,
                width: 32.w,
                ),
              ),
            ),
        ],
      ),
    ),
     
   );

  }
}