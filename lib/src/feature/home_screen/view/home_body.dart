import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/customDatePick.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/day_container.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/reaction.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
        
      padding: EdgeInsets.symmetric(vertical: 20.h),
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16, left: 18.w, right: 18.w),
          child: Column(
            children: [
              if(index == 0)
              Column(
                children: [
                  DayContainer(text: "Yesterday", onTap: () => selectDate(context)),
                  SizedBox(height: 13.h),
                ],
              ),


              Row(
                children: [
                  Image.asset(
                    "assets/images/parent_screen/p1.png",
                    height: 42.h,
                    width: 42.w,
                  ),
                  SizedBox(width: 13.w),
                  Expanded(
                    child: GestureDetector(
                      onLongPressStart:
                          (details) => showReactionMenu(
                            context,
                            details.globalPosition,
                          ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: const Color(0xFFFFFFFF),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Maren"),
                            SizedBox(height: 10),
                            Text(
                              "Are we using the correct font and chat bubble?",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
