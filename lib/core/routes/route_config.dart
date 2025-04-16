import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/feature/account_screen/account_screen.dart';
import 'package:possy_app/src/feature/auth_screens/view/create_group_screens/view/congratulation_screen.dart';
import 'package:possy_app/src/feature/auth_screens/view/create_group_screens/view/create_group_screen.dart';
import 'package:possy_app/src/feature/auth_screens/view/create_group_screens/view/create_or_join_screen.dart';
import 'package:possy_app/src/feature/auth_screens/view/signin_screens/view/sign_in_screen.dart';
import 'package:possy_app/src/feature/auth_screens/view/signup_screens/view/sign_up_screen.dart';
import 'package:possy_app/src/feature/auth_screens/view/signup_screens/view/signup_otp_screen.dart';
import 'package:possy_app/src/feature/auth_screens/view/signup_screens/view/successfully_registered_screen.dart';
import 'package:possy_app/src/feature/group_polls_screens/view/group_polls_screen.dart';
import 'package:possy_app/src/feature/home_screen/view/home_screen.dart';

import 'package:possy_app/src/feature/vibe_check_screen/vibe_check_screen.dart';
import 'package:possy_app/src/feature/parents_screens/view/parents_Screen.dart';


import '../../src/feature/auth_screens/view/forgot_password_screens/view/email_verify_screen.dart';
import '../../src/feature/auth_screens/view/forgot_password_screens/view/otp_verify_screen.dart';
import '../../src/feature/auth_screens/view/forgot_password_screens/view/successfully_reset_password_screen.dart';
import '../../src/feature/onboarding_screens/view/onboarding_screen.dart';

class RouteConfig{
 GoRouter goRouter = GoRouter(
     initialLocation: RouteName.parentsScreen,
     routes: [
      GoRoute(
          name: RouteName.onboardingScreen,
          path: RouteName.onboardingScreen,
          pageBuilder: (context, state) {
           return const MaterialPage(child: OnboardingScreen());
          }),
       GoRoute(
          name: RouteName.signInScreen,
          path: RouteName.signInScreen,
          pageBuilder: (context, state) {
           return MaterialPage(child: SignInScreen());
          }),
       GoRoute(
           name: RouteName.emailVerifyScreen,
           path: RouteName.emailVerifyScreen,
           pageBuilder: (context, state) {
             return const MaterialPage(child: EmailVerifyScreen());
           }),
       GoRoute(
           name: RouteName.otpVerifyScreen,
           path: RouteName.otpVerifyScreen,
           pageBuilder: (context, state) {
             return const MaterialPage(child: OTPVerifyScreen());
           }),
       GoRoute(
           name: RouteName.successfullyResetPasswordScreen,
           path: RouteName.successfullyResetPasswordScreen,
           pageBuilder: (context, state) {
             return const MaterialPage(child: SuccessfullyResetPasswordScreen());
           }),
       GoRoute(
          name: RouteName.signUpScreen,
          path: RouteName.signUpScreen,
          pageBuilder: (context, state) {
           return const MaterialPage(child: SignUpScreen());
          }),
       GoRoute(
          name: RouteName.signUpOTPScreen,
          path: RouteName.signUpOTPScreen,
          pageBuilder: (context, state) {
           return const MaterialPage(child: SignupOtpScreen());
          }),
       GoRoute(
          name: RouteName.successfullyRegisteredScreen,
          path: RouteName.successfullyRegisteredScreen,
          pageBuilder: (context, state) {
           return const MaterialPage(child: SuccessfullyRegisteredScreen());
          }),
       GoRoute(
          name: RouteName.crateOrJoinScreen,
          path: RouteName.crateOrJoinScreen,
          pageBuilder: (context, state) {
           return const MaterialPage(child: CreateOrJoinScreen());
          }),
       GoRoute(
          name: RouteName.createGroupScreen,
          path: RouteName.createGroupScreen,
          pageBuilder: (context, state) {
           return const MaterialPage(child: CreateGroupScreen());
          }),
       GoRoute(
          name: RouteName.groupPollsScreen,
          path: RouteName.groupPollsScreen,
          pageBuilder: (context, state) {
           return const MaterialPage(child: GroupPollsScreen());
          }),
       GoRoute(
          name: RouteName.congratulationScreen,
          path: RouteName.congratulationScreen,
          pageBuilder: (context, state) {
           return const MaterialPage(child: CongratulationScreen());
          }),
      GoRoute(
          name: RouteName.homeScreen,
          path: RouteName.homeScreen,
          pageBuilder: (context, state) {
           return const MaterialPage(child: HomeScreen());
          }),
     GoRoute(
          name: RouteName.parentsScreen,
          path: RouteName.parentsScreen,
          pageBuilder: (context, state) {
           return const MaterialPage(child: ParentsScreen());
          }),
       GoRoute(
          name: RouteName.vibeCheckScreen,
          path: RouteName.vibeCheckScreen,
          pageBuilder: (context, state) {
           return const MaterialPage(child: VibeCheckScreen());
          }),

       GoRoute(
           name: RouteName.accountScreen,
           path: RouteName.accountScreen,
           pageBuilder: (context, state) {
             return const MaterialPage(child: AccountScreen());
           }),

     ]);
}