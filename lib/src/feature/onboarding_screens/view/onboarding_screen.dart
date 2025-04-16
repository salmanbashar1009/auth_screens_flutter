
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/feature/onboarding_screens/view/widgets/custom_button.dart';



class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final headLineLarge = Theme.of(context).textTheme.headlineLarge;
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;

    return Stack(
      children: [
        Image.asset(AppImages.screenBackgroundImage, fit: BoxFit.cover),
        Positioned(
          top: 125.h,
          left: MediaQuery.of(context).size.width / 2 - 70,
          child: Text(
            "POSSE",
            style: headLineLarge?.copyWith(
              // fontFamily: GoogleFonts.gabarito().fontFamily,
              color: AuthColorPalette.white,
              fontSize: 44.sp,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2 + 18,
            decoration: BoxDecoration(
              color: AuthColorPalette.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.w),
                topLeft: Radius.circular(30.w),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 70.h),
                  Text(
                    "Let's Get Started",
                    style: headlineSmall?.copyWith(
                      color: AuthColorPalette.titleColor,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "If you want to join the conversation, \nplease log in or sign up.",
                    style: bodyLarge?.copyWith(
                      color: AuthColorPalette.bodyTextColor,
                      fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 44.h),
                  buildContainerButton(
                      context: context,
                      imagePath: AppImages.loginProceedIcon,
                      title: "Proceed to Login",
                      color: AuthColorPalette.secondary,
                      textColor: AuthColorPalette.titleColor,
                      circleColor: AuthColorPalette.white,
                      onTap: (){
                        // Navigator.pushNamed(context, RouteName.loginScreen);
                        context.push(RouteName.signInScreen);
                      }
                  ),
                  SizedBox(height: 12.h),
                  buildContainerButton(
                      context: context,
                      imagePath: AppImages.userPlusIcon,
                      title: "New User? Sign Up",
                      color: AuthColorPalette.primary,
                      textColor: AuthColorPalette.white,
                      iconColor: AuthColorPalette.white,
                      circleColor: AuthColorPalette.white.withOpacity(0.14),
                      onTap: (){
                        // Navigator.pushNamedAndRemoveUntil(context, RouteName.signUpScreen, (_) => false);
                        context.push(RouteName.signUpScreen);
                      }
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}