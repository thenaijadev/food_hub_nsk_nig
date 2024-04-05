import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/loading_widget.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/snackbar.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/auth_button.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/background_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/registration/form_button.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundWidget(
            image: "assets/images/sign_up_background.png",
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0).copyWith(top: 0),
                child: Column(
                  children: [
                    BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                      return state is AuthStateEmailVerificationLinkSent
                          ? Lottie.asset('assets/images/email_sent.json')
                          : Image.asset(
                              'assets/images/mail.png',
                              width: 250,
                            );
                    }),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return state is AuthStateEmailVerificationLinkSent
                            ? const TextWidget(
                                text:
                                    "An email verification link has been sent to your email. Verify your email and then come back to log in.",
                                color: AppColors.black,
                                textAlign: TextAlign.center,
                              )
                            : const TextWidget(
                                text:
                                    "An email verification link will be sent to your email. Verify your email and then come back to log in.",
                                color: AppColors.black,
                                textAlign: TextAlign.center,
                              );
                      },
                    ),
                    const Gap(20),
                    BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthStateAuthError) {
                          InfoSnackBar.showErrorSnackBar(
                              context, state.authError.message);
                        }
                      },
                      builder: (context, state) {
                        return state is AuthStateIsLoading
                            ? const LoadingWidget()
                            : state is AuthStateEmailVerificationLinkSent
                                ? FormButton(
                                    label: "Login",
                                    onTap: () {
                                      Navigator.of(context)
                                          .popAndPushNamed(Routes.login);
                                    },
                                  )
                                : PrimaryOrangeButton(
                                    label: "SIGN UP",
                                    onTap: () {
                                      context.read<AuthBloc>().add(
                                            const AuthEventSendEmailVerification(),
                                          );
                                    },
                                  );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
