import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/group_polls_style/group_polls_color_palette.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_header.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/group_polls_screens/view/widgets/add_poll_FAB.dart';
import 'package:possy_app/src/feature/group_polls_screens/view/widgets/group_polls_card.dart';
import 'package:possy_app/src/feature/group_polls_screens/view/widgets/history_section.dart';

class GroupPollsScreen extends StatelessWidget {
  const GroupPollsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final bodySmall = Theme.of(context).textTheme.bodySmall;
    final titleMedium = Theme.of(context).textTheme.titleMedium;

    return Scaffold(
      backgroundColor: GroupPollsColorPalette.screenBackground,
      floatingActionButton: AddPollFAB(onPressed: () {}),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonHeader(
            backgroundColor: GroupPollsColorPalette.headerBackground,
            backgroundContainerHeight: 165.h,
            bgImage: AppImages.groupPollsHeaderImage,
            child: CommonWidgets.customAppBar(
              context: context,
              leadingImagePath: "assets/images/avatar_without_bg.png",
              title: "Angie's Posse",
              titleColor: AppColor.primaryTextColor,
              subtitle: "Majority rules vibes",
              subtitleColor: GroupPollsColorPalette.subTitleColor,
              leadingBgColor: Color(0xFFFFFFFF),
              actionWidgets: CommonWidgets.circleButton(
                imgPath: AppIcons.unreadNotification,
                padding: EdgeInsets.all(10.r),
                onTap: () {},
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: GroupPollsCard(),
                  ),
                  SizedBox(height: 32.h),
                  HistorySection(titleMedium: titleMedium),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

