part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthStateIsRegistering extends AuthState {}

class AuthStateIsRegisteringwithGoogle extends AuthState {}

class AuthStateUserRegistered extends AuthState {
  AuthStateUserRegistered({required this.user});
  final User user;
}

class AuthStateRegistrationError extends AuthState {
  AuthStateRegistrationError({required this.error});
  final String error;
}

class AuthStateIsloggingIn extends AuthState {}

class AuthStateisLoggedIn extends AuthState {
  AuthStateisLoggedIn({required this.user});
  final User user;
}

class AuthStateLogInError extends AuthState {
  AuthStateLogInError({required this.error});
  final String error;
}

class AuthStateUserIsLoggedIn extends AuthState {
  AuthStateUserIsLoggedIn({required this.isLoggedIn});
  final bool isLoggedIn;
}
