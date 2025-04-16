import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/group_polls_style/group_polls_color_palette.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/group_polls_screens/view/widgets/poll_option_tile.dart';
import 'package:possy_app/src/feature/group_polls_screens/view/widgets/show_custom_pop_up_menu.dart';

class GroupPollsCardContent extends StatelessWidget {
   GroupPollsCardContent({
    super.key,
    required this.headlineSmall,
    required this.bodySmall, this.isInHistory,
  });

  final TextStyle? headlineSmall;
  final TextStyle? bodySmall;
  final bool? isInHistory;

  final GlobalKey _menuKey = GlobalKey();

  @override
  Widget build(BuildContext context)  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /// Profile Section
        CommonWidgets.customAppBar(
          context: context,
          leadingImagePath: "assets/images/avatar_without_bg.png",
          title: "Angie's Posse",
          titleColor: AppColor.primaryTextColor,
          subtitle: "Created by Admin",
          subtitleColor: GroupPollsColorPalette.subTitleColor,
          leadingBgColor: AuthColorPalette.greyscale200,
          actionWidgets: IconButton(
            key: _menuKey,
            icon: Icon(Icons.more_vert_rounded),
            onPressed: () async {
              showCustomPopupMenu(context:  context,key:  _menuKey);
            }
          ),
        ),
        Divider(color: AuthColorPalette.greyscale200,),
        const SizedBox(height: 24),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              /// Question
              Text(
                "Where should we go for dinner tonight?",
                style: headlineSmall?.copyWith(
                    color: AppColor.primaryTextColor,
                    fontWeight: FontWeight.w700
                ),
              ),

              SizedBox(height: 10.h),

              /// Time remaining
              isInHistory == true ? SizedBox() : Row(
                children:  [
                  Icon(Icons.access_time_filled, color: GroupPollsColorPalette.green600),
                  SizedBox(width: 6),
                  Text(
                    "Ends in 2 hrs",
                    style: bodySmall?.copyWith(
                        color: GroupPollsColorPalette.green600
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),
              /// Poll Options
              PollOptionTile(text: "Bombay Spice", percentage: 0.8,foregroundColor: GroupPollsColorPalette.fog200,isInHistory: isInHistory,),
              PollOptionTile(text: "The Cantina", percentage: 0.7,foregroundColor: GroupPollsColorPalette.orange,isInHistory: isInHistory,),
              PollOptionTile(text: "Le Petit Bistro", percentage: 0.1,foregroundColor: GroupPollsColorPalette.green400,isInHistory: isInHistory,),
              PollOptionTile(text: "Antonio’s Pizza", percentage: 0.4,foregroundColor: GroupPollsColorPalette.iceBlue,isInHistory: isInHistory,),
              SizedBox(height: 24.h,)
            ],
          ),
        )
      ],
    );
  }
}
