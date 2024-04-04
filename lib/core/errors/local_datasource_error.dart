import 'package:the_food_hub_nsk_nig/core/errors/auth_error.dart';

class LocalAuthUserError extends AuthError {
  LocalAuthUserError({required super.message});

  @override
  String toString() => 'LocalDataSourceError(message: $message)';
}
