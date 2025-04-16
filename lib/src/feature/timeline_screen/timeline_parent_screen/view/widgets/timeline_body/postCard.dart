import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/src/common_widget_style/common_style/timeline_style/timeline_color.dart';
import 'package:possy_app/src/feature/timeline_screen/timeline_parent_screen/view/widgets/timeline_body/show_popup_menu.dart';

class PostCard extends StatelessWidget {
  final String profilePicture;
  final String userName;
  final String postDate;
  final String caption;
  final String? postImage;
  final int reactAmount;
  final int commentAmount;

   PostCard({
    super.key,
    required this.profilePicture,
    required this.userName,
    required this.postDate,
    required this.caption,
    this.postImage,
    required this.reactAmount,
    required this.commentAmount,
  });


  final GlobalKey _menuKey = GlobalKey();

  Widget secondaryButton({required bool isCircle, required Widget child}) {
    return GestureDetector(
      onTap: () {
        debugPrint("\nTaped on post menu.\n");
      },
      child: Container(
        //width: 28.w,
       // height: 28.w,
        decoration: BoxDecoration(
          color: TimelineColor.secondaryColor,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircle ? BorderRadius.circular(1000) : BorderRadius.circular(24.r)
          ,
          border: Border.all(color: Color(0xffECEFF3)),
        ),
        child: child,
        // Icon(Icons.menu,color: Color(0xff4A4C56),size: 15.r,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          spacing: 12.h,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              spacing: 10.w,
              children: [
                ///Profile Picture
                GestureDetector(
                  onTap: () {
                    debugPrint("\nTaped on profile picture.\n");
                  },
                  child: ClipOval(
                    child: Image.asset(
                      profilePicture,
                      width: 40.w,
                      height: 40.w,
                    ),
                  ),
                ),

                /// User name and post date
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        debugPrint("\nTaped on User name.\n");
                      },
                      child: Text(
                        userName,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: TimelineColor.textColor
                        ),
                      ),
                    ),
                    Text(
                      postDate,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: TimelineColor.lightTextColor,
                      ),
                    ),
                  ],
                ),

                Spacer(),

                /// post menu
                Stack(
                  children: [
                    GestureDetector(
                      key: _menuKey,
                      onTap: () async {
                        debugPrint("\nTaped on post menu.\n");
                         showPopupMenu(
                           context: context,
                           menuKey: _menuKey
                         );
                      },
                      child: Container(
                        width: 28.w,
                        height: 28.w,
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                          color: TimelineColor.secondaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xffECEFF3)),
                        ),
                        child: Image.asset(
                          AppIcons.threeDot,
                          color: TimelineColor.onSecondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            ///caption
            SelectableText(caption, style: Theme.of(context).textTheme.bodyMedium),

            /// Image
            if (postImage != null)
              Image.asset(
                postImage!,
                width: double.infinity,
                height: 240.h,
                fit: BoxFit.cover,
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 16.w,
              children: [
                secondaryButton(
                  isCircle: false,
                  child: Padding(
                    padding: EdgeInsets.all(4.r ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 4.w,
                      children: [
                        Icon(Icons.heart_broken_outlined,size: 16.r,
                          color: TimelineColor.onSecondaryColor,),

                        Text(reactAmount.toString(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: TimelineColor.onSecondaryColor,
                        ),)
                      ],
                    ),
                  )
                ),

                secondaryButton(
                    isCircle: false,
                    child: Padding(
                      padding: EdgeInsets.all(4.r ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 4.w,
                        children: [
                          Icon(Icons.mode_comment_outlined,
                            size: 16.r,
                            color: TimelineColor.onSecondaryColor,),

                          Text(commentAmount.toString(),
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: TimelineColor.onSecondaryColor,
                                fontWeight: FontWeight.w600
                            ),)
                        ],
                      ),
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
