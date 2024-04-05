import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/background_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/home_content_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/overlay_widget.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
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
