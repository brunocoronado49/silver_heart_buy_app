import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silver_heart_buy/bloc/auth/auth_bloc.dart';
import 'package:silver_heart_buy/presentation/intro/widgets/auth_button.dart';
import 'package:silver_heart_buy/routes/routes.dart';
import 'package:silver_heart_buy/theme/app_theme.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authCubit = context.watch<Authcubit>();
    final isSigninIn = authCubit.state is AuthStateLoading;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppTheme.primaryColor,
            AppTheme.secondaryColor,
            AppTheme.thirdColor,
          ]
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 150),
            alignment: Alignment.topCenter,
            child: const Text(
              "Inicia sesión o crea una cuenta nueva",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
          if (isSigninIn) const CircularProgressIndicator(color: Colors.black),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const SizedBox(height: 50),
                AuthButton(
                  text: "Crea una cuenta",
                  imagePath: "assets/edit.png",
                  onTap: () {
                    authCubit.reset();
                    Navigator.pushNamed(context, Routes.signUp);
                  },
                ),
                const SizedBox(height: 10),
                AuthButton(
                  text: "Inicia sesión",
                  imagePath: "assets/user.png",
                  onTap: () {
                    authCubit.reset();
                    Navigator.pushNamed(context, Routes.signIn);
                  },
                ),
                const SizedBox(height: 30),
                const Text(
                  "Puedes crear una cuenta con tu correo o si ya tienes puedes iniciar sesión",
                  style: TextStyle(
                    color: AppTheme.thirdColor,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}