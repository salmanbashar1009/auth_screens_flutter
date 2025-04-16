import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/group_polls_style/group_polls_color_palette.dart';
import 'package:possy_app/src/feature/vibe_check_screen/widgets/avatar_stack.dart';

class PollOptionTile extends StatelessWidget {
  final String text;
  final double percentage; // Between 0.0 to 1.0
  final Color backgroundColor;
  final Color foregroundColor;
  final bool? isInHistory;
  final VoidCallback? onTap;

  const PollOptionTile({
    super.key,
    required this.text,
    required this.percentage,
    this.backgroundColor =  GroupPollsColorPalette.optionTileBackground,
    this.foregroundColor = Colors.transparent,
    this.onTap,
    this.isInHistory = false
  });

  @override
  Widget build(BuildContext context) {

    final bodyLarge = Theme.of(context).textTheme.bodyLarge;

    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(bottom: 12.h,),
          child: GestureDetector(
            onTap: (){
              debugPrint("\n\onTap Poll option: Voting completed\n\n");
            },
            child: Stack(
              children: [
                // Progress bar as background
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: LinearProgressIndicator(
                    value: percentage,
                    backgroundColor: backgroundColor,
                    valueColor: AlwaysStoppedAnimation<Color>( percentage == 0 ? Colors.transparent : foregroundColor  ),
                    minHeight: 54.h,
                  ),
                ),

                // Text overlay
                Container(
                  alignment: Alignment.centerLeft,
                  padding:  EdgeInsets.symmetric(horizontal: 16.h),
                  height: 56.h,
                  child: Text(
                    text,
                    style:  bodyLarge?.copyWith(
                      color: AppColor.primaryTextColor,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                // BLUR OVERLAY exactly matching the container size
                if (isInHistory == true)
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 2),
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      percentage != 0 ?  Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding:  EdgeInsets.only(bottom: 12.h),
            child: AvatarStack(imageUrls: [
              'https://randomuser.me/api/portraits/men/1.jpg',
              'https://randomuser.me/api/portraits/men/2.jpg',
              'https://randomuser.me/api/portraits/men/8.jpg',
              'https://randomuser.me/api/portraits/men/9.jpg',
              'https://randomuser.me/api/portraits/men/10.jpg',
            ],maxDisplay: 4,),
          ),
        ) : SizedBox()
      ],
    );
  }
}
