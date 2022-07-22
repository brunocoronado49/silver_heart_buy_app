import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silver_heart_buy/bloc/bloc.dart';
import 'package:silver_heart_buy/routes/routes.dart';
import 'package:silver_heart_buy/theme/app_theme.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static Widget create() {
    return BlocConsumer<Authcubit, AuthState>(
      listener: (context, state) {
        if (state is AuthStateSignedOut) {
          _navigatorKey.currentState?.pushNamedAndRemoveUntil(
            Routes.intro, (r) => false
          );
        } else if (state is AuthStateLoading) {
          _navigatorKey.currentState?.pushNamedAndRemoveUntil(
            Routes.home, (r) => false
          );
        }
      },
      builder: (context, state) {
        return const MyApp();
      },
    );
  } 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      title: "Silver Heart",
      onGenerateRoute: Routes.routes,
      theme: AppTheme.theme,
    );
  }
}