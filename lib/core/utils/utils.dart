import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:possy_app/src/common_widget_style/common_style/timeline_style/timeline_color.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';

class Utils {
  static void showSnackBar(
    String message,
    BuildContext context, {
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor ?? Colors.black87,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static String formatDate(
    DateTime dateTime, {
    String formatType = 'yyyy-MM-dd',
  }) {
    switch (formatType) {
      case 'yyyy-MM-dd':
        // Format: 2025-04-10
        return DateFormat('yyyy-MM-dd').format(dateTime);

      case 'dd-MM-yyyy':
        // Format: 10-04-2025
        return DateFormat('dd-MM-yyyy').format(dateTime);

      case 'MMM dd, yyyy':
        // Format: Apr 10, 2025
        return DateFormat('MMM dd, yyyy').format(dateTime);

      case 'EEEE, MMM d':
        // Format: Thursday, Apr 10
        return DateFormat('EEEE, MMM d').format(dateTime);

      case 'h:mm a':
        // Format: 5:30 PM (12-hour clock with AM/PM)
        return DateFormat('h:mm a').format(dateTime);

      default:
        // Fallback: default to ISO format
        return DateFormat('yyyy-MM-dd').format(dateTime);
    }
  }

  static String? validateDropdown<T>(T? value, String message) {
    if (value == null || (value is String && value.isEmpty)) {
      return message;
    }
    return null;
  }

  static AppBar appBarBackButton(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: ImageIcon(AssetImage('assets/icons/back.png'), size: 20.r),
      ),

      ///size: 20.r
    );
  }

}
