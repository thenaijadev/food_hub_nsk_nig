import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_food_hub_nsk_nig/core/connection/network_info.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<DataConnectionChecker>(DataConnectionChecker());

  sl.registerSingleton<DataConnectionChecker>(DataConnectionChecker());
  sl.registerSingleton<NetworkInfo>(NetworkInfoImpl(connectionChecker: sl()));
  sl.registerSingleton<Future<SharedPreferences>>(
      SharedPreferences.getInstance());
}
