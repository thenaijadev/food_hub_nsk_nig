import 'package:dartz/dartz.dart';
import 'package:local_auth/local_auth.dart';
import 'package:the_food_hub_nsk_nig/core/errors/auth_error.dart';
import 'package:the_food_hub_nsk_nig/core/errors/local_auth_error.dart';
import 'package:the_food_hub_nsk_nig/core/errors/message_error.dart';
import 'package:the_food_hub_nsk_nig/core/errors/user_error.dart';
import 'package:the_food_hub_nsk_nig/features/auth/data/models/auth_user_model.dart';
import 'package:the_food_hub_nsk_nig/features/users/data/users/user_model.dart';

//----------------------------------Auth-----------------------------
typedef EitherAuthUserOrAuthError = Either<AuthError, AuthUserModel>;
typedef EitherTrueOrAuthError = Either<AuthError, bool>;

typedef EitherFutureTrueOrAuthError = Future<Either<AuthError, bool>>;

typedef FutureEitherAuthUserOrAuthError
    = Future<Either<AuthError, AuthUserModel>>;

typedef FutureEitherLocalAuthUserOrAuthError
    = Future<Either<AuthError, AuthUserModel>>;

//-------------------------USER-------------------------------------------------
// typedef EitherFutureTrueOrUserError = Future<Either<UserError, bool>>;
typedef EitherUserModelOrUserError = Either<UserError, UserModel>;
typedef EitherBoolOrUserError = Either<UserError, bool>;

typedef FutureEitherLocalUserModelOrAuthError
    = Future<Either<AuthError, UserModel>>;

// typedef FutureEitherLocalUserOrUserError = Future<Either<UserError, UserModel>>;
// typedef FutureEitherUserOrUserError = Future<Either<UserError, UserModel>>;
// typedef EitherTrueOrUserError = Future<Either<UserError, bool>>;
// typedef EitherUserOrUserError = Either<UserError, UserModel>;

//-----------------------Local Auth -------------------------------------------

typedef EitherBoolOrLocalAuthError = Future<Either<LocalAuthError, bool>>;

typedef EitherListOfBiometricsOrLocalAuthError
    = Future<Either<LocalAuthError, List<BiometricType>>>;

// ---------------------Chat---------------------------

typedef EitherBoolOrChatError = Either<MessageError, bool>;
