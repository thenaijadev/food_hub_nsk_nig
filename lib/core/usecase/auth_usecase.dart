import 'package:the_food_hub_nsk_nig/core/utils/typedef.dart';

abstract class UseCase<Type> {
  FutureEitherAuthUserOrAuthError createUser(
      {required String email,
      required String password,
      required String userName});

  FutureEitherAuthUserOrAuthError logIn({
    required String email,
    required String password,
  });
  FutureEitherAuthUserOrAuthError getcurrentUser();

  EitherFutureTrueOrAuthError logOut();
  EitherFutureTrueOrAuthError sendEmailVerification();
  EitherFutureTrueOrAuthError sendPasswordReset({required String toEmail});
  EitherBoolOrLocalAuthError canAuthenticateWithBiometrics();
  EitherListOfBiometricsOrLocalAuthError getBiometricsTypes();
  EitherBoolOrLocalAuthError authenticate();
}
