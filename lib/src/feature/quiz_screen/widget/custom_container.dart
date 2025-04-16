import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/quiz_screen/widget/customSelectContent.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Color(0xffFFFFFF),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset("assets/images/parent_screen/q11.png"),
                ),
                SizedBox(width: 4.w),
                Text(
                  "Group Quiz",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff389EA2),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              "What flavor ice-cream would each member of your posse be?",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
            ),

            SizedBox(height: 16.h),
            CustomselectContent(
              text: "Midnight Mocha Crunch",
            ),
            SizedBox(height: 8.h,),
            CustomselectContent(
              text: "Electric Blue Raspberry Swirl",
            ),
            SizedBox(height: 8.h,),
            CustomselectContent(
              text: "Caramel Chaos",
            ),
            SizedBox(height: 8.h,),
            CustomselectContent(
              text: "Honey Lavender Bliss",
            ),
            SizedBox(height: 8.h,),
          ],
        ),
      ),
    );
  }
}
