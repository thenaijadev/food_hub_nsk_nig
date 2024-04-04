import 'package:the_food_hub_nsk_nig/core/utils/typedef.dart';

abstract class LocalAuthRepository {
  EitherBoolOrLocalAuthError canAuthenticateWithBiometrics();
  EitherListOfBiometricsOrLocalAuthError getBiometricsTypes();
  EitherBoolOrLocalAuthError authenticate();
}
