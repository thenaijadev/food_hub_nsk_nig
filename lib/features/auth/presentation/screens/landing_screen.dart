import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/loading_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/bloc/auth_bloc.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    context.read<AuthBloc>().add(const AuthEventGetCurrentUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 177, 158),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthStateIsLoggedIn) {
            if (state.user.isEmailVerified == false) {
              Navigator.pushReplacementNamed(context, Routes.emailVerification);
            } else {
              Navigator.pushReplacementNamed(context, Routes.baseScreen);
            }
          }
          if (state is AuthStateAuthError) {
            Navigator.pushReplacementNamed(context, Routes.login);
          }
        },
        builder: (context, state) {
          return const Center(
              child: LoadingWidget(
            size: 100,
          ));
        },
      ),
    );
  }
}
