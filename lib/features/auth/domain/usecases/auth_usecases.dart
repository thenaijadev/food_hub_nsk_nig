// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:the_food_hub_nsk_nig/core/usecase/auth_usecase.dart';
import 'package:the_food_hub_nsk_nig/core/utils/typedef.dart';
import 'package:the_food_hub_nsk_nig/features/auth/domain/entities/auth_user_entity.dart';
import 'package:the_food_hub_nsk_nig/features/auth/domain/repositories/firebase_auth_repository.dart';
import 'package:the_food_hub_nsk_nig/features/auth/domain/repositories/local_auth_repository.dart';

class AuthUsecase implements UseCase<AuthUserEntity> {
  final FirebaseAuthRepository authRepository;
  final LocalAuthRepository localAuthRepository;
  AuthUsecase({
    required this.authRepository,
    required this.localAuthRepository,
  });

  @override
  FutureEitherAuthUserOrAuthError logIn(
      {required String email, required String password}) {
    return authRepository.logIn(email: email, password: password);
  }

  @override
  EitherFutureTrueOrAuthError logOut() {
    return authRepository.logOut();
  }

  @override
  EitherFutureTrueOrAuthError sendEmailVerification() {
    return authRepository.sendEmailVerification();
  }

  @override
  EitherFutureTrueOrAuthError sendPasswordReset({required String toEmail}) {
    return authRepository.sendPasswordReset(toEmail: toEmail);
  }

  @override
  FutureEitherAuthUserOrAuthError getcurrentUser() {
    return authRepository.getcurrentUser();
  }

  @override
  FutureEitherAuthUserOrAuthError createUser({
    required String email,
    required String password,
    required String userName,
  }) {
    return authRepository.createUser(
        email: email, password: password, userName: userName);
  }

  @override
  EitherBoolOrLocalAuthError canAuthenticateWithBiometrics() async {
    return localAuthRepository.canAuthenticateWithBiometrics();
  }

  @override
  EitherListOfBiometricsOrLocalAuthError getBiometricsTypes() async {
    return localAuthRepository.getBiometricsTypes();
  }

  @override
  EitherBoolOrLocalAuthError authenticate() async {
    return localAuthRepository.authenticate();
  }
}
