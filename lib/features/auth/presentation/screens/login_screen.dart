import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/background_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/registration/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackgroundWidget(
            image: "assets/images/sign_up_background.png",
          ),
          LoginForm()
        ],
      ),
    );
  }
}
