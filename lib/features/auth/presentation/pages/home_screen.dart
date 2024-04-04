import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/background_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/home_content_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/overlay_widget.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthStateIsLoggedIn) {
            if (state.user.isEmailVerified == true) {
              Navigator.pushNamed(context, Routes.home);
            }
          }
        },
        child: const Stack(
          children: [BackgroundWidget(), OverLayWidget(), HomeContentWidget()],
        ),
      ),
    );
  }
}
