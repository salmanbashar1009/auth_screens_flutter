import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/src/common_widget_style/common_style/vibe_check_style/vibe_check_color.dart';
import 'package:possy_app/src/feature/vibe_check_screen/widgets/vibe_check_header.dart';
import 'package:possy_app/src/feature/vibe_check_screen/widgets/vibe_check_quiz.dart';

class VibeCheckScreen extends StatelessWidget {
  const VibeCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: VibeCheckColor.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VibeCheckHeader(textTheme: textTheme,),
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Padding(
                  padding: AppPadding.screenHorizontalPadding,
                  child: Column(
                    children: [
                      SizedBox(height: 24.h,),
                      VibeCheckQuizWidget(textTheme: textTheme),
                      Padding(
                        padding: EdgeInsets.only(top: 16.h,bottom: 18.h),
                        child: Row(
                          children: [
                            Expanded(child: Divider()),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Color(0xFFE6E0FF)
                              ),
                              child: Text('Yesterday',style: textTheme.bodyMedium!.copyWith(color: Color(0xFF4A4C56),),),),
                            Expanded(child: Divider()),
                          ],
                        ),
                      ),
                      VibeCheckQuizWidget(textTheme: textTheme),
                      Padding(
                        padding: EdgeInsets.only(top: 16.h,bottom: 18.h),
                        child: Row(
                          children: [
                            Expanded(child: Divider()),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Color(0xFFE6E0FF)
                              ),
                              child: Text('12 April, 2025',style: textTheme.bodyMedium!.copyWith(color: Color(0xFF4A4C56),),),),
                            Expanded(child: Divider()),
                          ],
                        ),
                      ),
                      VibeCheckQuizWidget(textTheme: textTheme),
                      SizedBox(height: 50.h,),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
        ),
    );
  }
}