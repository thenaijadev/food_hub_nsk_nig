import 'package:the_food_hub_nsk_nig/core/network/typedef.dart';

abstract class AuthProvider {
  EitherUser signUpWithEmail(
      {required String fullName,
      required String email,
      required String password});

  EitherUser signUpWithGoogle();
  EitherUser signInWithGoogle();

  EitherUser login({required String email, required String password});

  EitherBool isLoggedIn();
}
