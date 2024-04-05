import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_food_hub_nsk_nig/core/connection/network_info.dart';
import 'package:the_food_hub_nsk_nig/features/auth/data/datasources/local/local_user_data_source.dart';
import 'package:the_food_hub_nsk_nig/features/auth/data/datasources/remote/firebase_auth_service.dart';
import 'package:the_food_hub_nsk_nig/features/auth/data/datasources/remote/local_auth_service.dart';
import 'package:the_food_hub_nsk_nig/features/auth/data/repositories/firebase_auth_repository_implementation.dart';
import 'package:the_food_hub_nsk_nig/features/auth/data/repositories/local_auth_repository_implementation.dart';
import 'package:the_food_hub_nsk_nig/features/auth/domain/repositories/firebase_auth_repository.dart';
import 'package:the_food_hub_nsk_nig/features/auth/domain/repositories/local_auth_repository.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // sl.registerSingleton<DataConnectionChecker>(DataConnectionChecker());
  sl.registerSingleton<Future<SharedPreferences>>(
      SharedPreferences.getInstance());
  sl.registerSingleton<DataConnectionChecker>(DataConnectionChecker());
  sl.registerSingleton<LocalAuthentication>(LocalAuthentication());
  sl.registerSingleton<NetworkInfo>(NetworkInfoImpl(connectionChecker: sl()));

  sl.registerSingleton<LocalAuthService>(
      LocalAuthServiceImplementation(auth: sl()));

  sl.registerSingleton<LocalAuthRepository>(
      LocalAuthRepositoryImplementation(authService: sl()));
  sl.registerSingleton<FirebaseAuthService>(FirebaseAuthServiceImlementation());
  sl.registerSingleton<AuthUserLocalDataSource>(
      AuthUserLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerSingleton<FirebaseAuthRepository>(
      FirebaseAuthRepositoryImplementation(
          networkInfo: sl(), localAuthUserSource: sl(), authService: sl()));
  // sl.registerSingleton<NetworkInfo>(NetworkInfoImpl(connectionChecker: sl()));
}
