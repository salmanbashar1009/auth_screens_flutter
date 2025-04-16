import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_input_decoration_theme.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';

import '../../auth_widgets/footer_text.dart';

class EmailVerifyScreen extends StatelessWidget {
  const EmailVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Text Theme
    // final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final titleSmall = Theme.of(context).textTheme.titleSmall;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Forgot Password?",
                  style: headlineSmall?.copyWith(
                    color: AuthColorPalette.titleColor,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Please enter your email address",
                  style: titleSmall?.copyWith(
                    color: AuthColorPalette.textColorGreyscale,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 40.h),
                TextFormField(
                  decoration: AuthInputDecorationTheme.lightInputDecorationTheme(
                    context: context,
                    hintText: "Your Email",
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 4.w),
                      child: ImageIcon(AssetImage(AppImages.emailIcon),size: 18.r,),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                CommonWidgets.primaryButton(
                  context: context,
                  title: "Submit",
                  color: AuthColorPalette.primary,
                  textColor: AuthColorPalette.white,
                  onPressed: () {
                    context.pushNamed(RouteName.otpVerifyScreen);
                  },
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
