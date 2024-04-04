import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/loading_widget.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/snackbar.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/auth_button.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/auth_option_label.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/oauth_button.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/signup_signin_opotion_text.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormFieldState> key_2 = GlobalKey<FormFieldState>();

  final GlobalKey<FormFieldState> key_3 = GlobalKey<FormFieldState>();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              text: "Login",
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            InputFieldWidget(
                label: "E-mail",
                hintText: "eg: example@gmail.com",
                onChanged: (val) {},
                textFieldkey: key_2),
            InputFieldWidget(
                obscureText: obscureText,
                label: "Password",
                hintText: "Password",
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                    size: 20,
                  ),
                ),
                onChanged: (val) {},
                textFieldkey: key_3),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthStateIsLoggedIn) {
                  Navigator.pushReplacementNamed(context, Routes.home);
                } else if (state is AuthStateAuthError) {
                  InfoSnackBar.showErrorSnackBar(
                      context, state.authError.message);
                }
              },
              builder: (context, state) {
                return state is AuthStateIsLoading
                    ? const LoadingWidget()
                    : PrimaryOrangeButton(
                        label: "SIGN UP",
                        onTap: () {
                          // if (_formKey.currentState!.validate()) {}
                          final String email = key_2.currentState?.value;
                          final String password = key_3.currentState?.value;
                          authBloc.add(AuthEventLogin(
                            email: email,
                            password: password,
                          ));
                        },
                      );
              },
            ),
            SignInSignUpOptionText(
                labelColor: Colors.black,
                altColor: AppColors.orange,
                label: "Don't have an account?",
                alternative: "Sign Up",
                onAlternative: () {
                  Navigator.pushReplacementNamed(context, Routes.registration);
                }),
            const SizedBox(
              height: 20,
            ),
            const AuthOptionLabel(
              line: "assets/images/line_grey.png",
              color: Colors.black,
              label: "Login with",
            ),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthStateIsLoggedIn) {
                  Navigator.pushReplacementNamed(context, Routes.home);
                } else if (state is AuthStateAuthError) {
                  InfoSnackBar.showErrorSnackBar(
                      context, state.authError.message);
                }
              },
              builder: (context, state) {
                return state is AuthStateIsLoading
                    ? const Flexible(child: LoadingWidget())
                    : OAuthButton(
                        image: "google",
                        label: "Google",
                        onTap: () async {
                          // authBloc.add(AuthEventRegisterWithGoogle());
                          //TODO:Google Auth
                        },
                        verticalPadding: 0,
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
