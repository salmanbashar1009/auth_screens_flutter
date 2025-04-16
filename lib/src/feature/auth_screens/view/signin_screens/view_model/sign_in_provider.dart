import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/feature/auth_screens/view/signin_screens/model/sign_in_model.dart';

class SignInProvider extends StateNotifier<SignInModel> {
  SignInProvider() : super(const SignInModel());

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  void toggleIsRemember(){
    state = state.copyWith(isRemember: !state.isRemember);
  }

  void checkIsLoading(){
    state = state.copyWith(isLoading: !state.isLoading);
  }
}

final signInProvider = StateNotifierProvider<SignInProvider, SignInModel>(
  (ref) => SignInProvider(),
);
