import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_food_hub_nsk_nig/config/dependency_injection/dependency_container.dart';
import 'package:the_food_hub_nsk_nig/config/router/app_router.dart';
import 'package:the_food_hub_nsk_nig/config/superbase/provider/super_base_provoder_impl.dart';
import 'package:the_food_hub_nsk_nig/features/auth/domain/usecases/auth_usecases.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:the_food_hub_nsk_nig/features/cart/bloc/cart_bloc.dart';

void main() async {
  appInitialization();
  await initializeDependencies();
  runApp(const MyApp());
}

appInitialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SuperBaseProviderImpl().superBaseInit();
  await Hive.initFlutter();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authUsecase:
                  AuthUsecase(localAuthRepository: sl(), authRepository: sl()),
            ),
          ),
          BlocProvider<CartBloc>(create: (BuildContext context) => CartBloc())
        ],
        child: MaterialApp(
          theme: ThemeData(textTheme: const TextTheme()),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          initialRoute: "/",
          onGenerateRoute: appRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
