import 'package:the_food_hub_nsk_nig/core/errors/auth_error.dart';

class AuthUserError extends AuthError {
  AuthUserError({required super.message});

  @override
  String toString() => 'AuthUserError(message: $message)';
}
