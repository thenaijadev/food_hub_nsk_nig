import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_food_hub_nsk_nig/core/errors/auth_error.dart';
import 'package:the_food_hub_nsk_nig/core/errors/local_auth_error.dart';
import 'package:the_food_hub_nsk_nig/features/auth/data/models/auth_user_model.dart';
import 'package:the_food_hub_nsk_nig/features/auth/domain/entities/auth_user_entity.dart';
import 'package:the_food_hub_nsk_nig/features/auth/domain/usecases/auth_usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthUsecase authUsecase,
  }) : super(AuthStateIsNotLoggedIn()) {
    on<AuthEventGetCurrentUser>((event, emit) async {
      emit(const AuthStateIsLoading());

      final authUser = await authUsecase.getcurrentUser();
      authUser.fold((l) {
        emit(AuthStateAuthError(authError: AuthError(message: l.message)));
      }, (r) {
        emit(AuthStateIsLoggedIn(user: r));
      });
    });

    on<AuthEventCreateUser>((event, emit) async {
      emit(const AuthStateIsLoading());
      final String email = event.email;
      final String password = event.password;
      final String userName = event.userName;

      final authUser = await authUsecase.createUser(
          email: email, password: password, userName: userName);
      authUser.fold(
          (l) => emit(
              AuthStateAuthError(authError: AuthError(message: l.message))),
          (r) async {
        emit(AuthStateUserCreated(user: r));
      });
    });

    on<AuthEventLogin>((event, emit) async {
      emit(const AuthStateIsLoading());
      final String email = event.email;
      final String password = event.password;

      final authUser =
          await authUsecase.logIn(email: email, password: password);
      authUser.fold(
          (l) => emit(
                AuthStateAuthError(
                  authError: AuthError(message: l.message),
                ),
              ), (r) {
        emit(AuthStateIsLoggedIn(user: r));
      });
    });

    on<AuthEventLogout>((event, emit) async {
      emit(const AuthStateIsLoading());

      final authUser = await authUsecase.logOut();
      authUser.fold(
          (l) => emit(
                AuthStateAuthError(
                  authError: AuthError(message: l.message),
                ),
              ), (r) {
        emit(AuthStateIsNotLoggedIn());
      });
    });

    on<AuthEventSendEmailVerification>((event, emit) async {
      emit(const AuthStateIsLoading());
      final authUser = await authUsecase.sendEmailVerification();
      authUser.fold((l) => AuthError(message: l.message), (r) {
        emit(const AuthStateEmailVerificationLinkSent());
      });
    });

    on<AuthEventSendPasswordReset>((event, emit) async {
      emit(const AuthStateIsLoading());
      final toEmail = event.toEmail;
      final authUser = await authUsecase.sendPasswordReset(toEmail: toEmail);
      authUser.fold(
          (l) => emit(
              AuthStateAuthError(authError: AuthError(message: l.message))),
          (r) {
        emit(const AuthStatePasswordResetSent());
      });
    });

    on<AuthEventAuthWithBiometrics>((event, emit) async {
      emit(const AuthStateIsLoading());
      final bioAuth = await authUsecase.authenticate();
      bioAuth.fold(
          (l) => emit(AuthStateBiometricsError(
              error: LocalAuthError(message: l.message))), (r) {
        emit(const AuthStateIsLoggedIn(
            user: AuthUserModel(
                id: "id", email: "email", isEmailVerified: true)));
      });
    });
  }
}
