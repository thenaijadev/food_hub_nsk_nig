import 'package:the_food_hub_nsk_nig/core/connection/network_info.dart';
import 'package:the_food_hub_nsk_nig/core/utils/typedef.dart';
import 'package:the_food_hub_nsk_nig/features/auth/data/datasources/local/local_user_data_source.dart';
import 'package:the_food_hub_nsk_nig/features/auth/data/datasources/remote/firebase_auth_service.dart';
import 'package:the_food_hub_nsk_nig/features/auth/domain/repositories/firebase_auth_repository.dart';

class FirebaseAuthRepositoryImplementation implements FirebaseAuthRepository {
  final FirebaseAuthService authService;
  final AuthUserLocalDataSource localAuthUserSource;
  final NetworkInfo networkInfo;
  FirebaseAuthRepositoryImplementation({
    required this.authService,
    required this.localAuthUserSource,
    required this.networkInfo,
  });
  @override
  FutureEitherAuthUserOrAuthError createUser(
      {required String email,
      required String password,
      required String userName}) async {
    final user = authService.createUser(
        email: email, password: password, userName: userName);
    await localAuthUserSource.saveUser(user);
    return user;
  }

  @override
  FutureEitherAuthUserOrAuthError getcurrentUser() async {
    if (await networkInfo.isConnected!) {
      return authService.getCurrentUser();
    }

    return localAuthUserSource.getUser();
  }

  @override
  FutureEitherAuthUserOrAuthError logIn(
      {required String email, required String password}) async {
    final user = authService.logIn(email: email, password: password);
    await localAuthUserSource.saveUser(user);
    return user;
  }

  @override
  EitherFutureTrueOrAuthError logOut() async {
    final isLoggedOut = authService.logOut();
    await localAuthUserSource.deleteUser();
    return isLoggedOut;
  }

  @override
  EitherFutureTrueOrAuthError sendEmailVerification() {
    return authService.sendEmailVerification();
  }

  @override
  EitherFutureTrueOrAuthError sendPasswordReset({required String toEmail}) {
    return authService.sendPasswordReset(toEmail: toEmail);
  }
}
