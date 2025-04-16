import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/common_widget_style/common_style/group_polls_style/group_polls_color_palette.dart';

class TimelineLabel extends StatelessWidget {
  final String label;

  const TimelineLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(
              color: GroupPollsColorPalette.fog200,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
          ),
          Container(
            padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 6.h),
            decoration: BoxDecoration(
              color: GroupPollsColorPalette.fog200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF2E2A45),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
