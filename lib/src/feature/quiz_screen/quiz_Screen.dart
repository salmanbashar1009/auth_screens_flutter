import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/src/feature/quiz_screen/widget/custom_container.dart';
import 'package:possy_app/src/feature/quiz_screen/widget/quizeHeader.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: Color(0xffF1FAF9),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         QuizeHeader(textTheme: textTheme,),
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Padding(
                  padding: AppPadding.screenHorizontalPadding,
                  child: Column( 
                     children: [
                      SizedBox(height:24.h ,),
                      CustomContainer(),
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