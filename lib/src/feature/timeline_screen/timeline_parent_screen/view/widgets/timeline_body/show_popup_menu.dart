import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/utils/utils.dart';
import 'package:possy_app/src/common_widget_style/common_style/timeline_style/timeline_color.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/timeline_screen/timeline_parent_screen/view/widgets/confirmation_alert_dialog/custom_confirmation_dialog.dart';

void showPopupMenu({required BuildContext context, required GlobalKey menuKey}) async {
  final RenderBox renderBox = menuKey.currentContext!.findRenderObject() as RenderBox;
  final Offset offset = renderBox.localToGlobal(Offset.zero); // top-left position
  final Size size = renderBox.size;

  await showMenu<String>(
    context: context,
    color: Colors.white,
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    position: RelativeRect.fromLTRB(
      offset.dx,
      offset.dy + size.height,
      offset.dx + size.width,
      offset.dy,
    ),
    items: [
      PopupMenuItem<String>(
        value: "view",
        child: popupMenu(context: context,iconPath: AppIcons.personFill,text: "View Profile")
      ),

     const PopupMenuDivider(),

      PopupMenuItem<String>(
          value: "report",
          child: popupMenu(context: context,iconPath: AppIcons.report,text: "Report")
      ),

      const PopupMenuDivider(),

      PopupMenuItem<String>(
          value: "snooze",
          child: popupMenu(context: context,iconPath: AppIcons.snooze,text: "Snooze")
      ),
    ],
  ).then((value) async {
    if (value == "view") {
      debugPrint("\nview profile pressed\n");
    }
    else if(value == "report"){

     await CommonWidgets.customConfirmationBottomSheet(
          context: context,
          confirmButtonText: "Report",
          iconPath: AppIcons.snooze,
         bodyText: "Do you want to snooze this user for 7 days?",
         onConfirm: (){},
     );

      debugPrint("\nreport pressed\n");
    }
    else if(value == "snooze"){
      debugPrint("\nsnooze pressed\n");
    }
  });
}

Widget popupMenu({required BuildContext context,  required String iconPath, required String text}){
  return Padding(
    padding: EdgeInsets.all(16.r),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 10.w,
      children: [
        Image.asset(iconPath,width: 18.w,height: 18.w,fit: BoxFit.cover,color: TimelineColor.iconColor,),
        Text(text,style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: TimelineColor.textColor
        ),)
      ],
    ),
  );
}

