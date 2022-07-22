import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silver_heart_buy/bloc/bloc.dart';
import 'package:silver_heart_buy/repository/repositories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBloc(UserRepoImp())..getUser(),
      child: const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
         child: Text('HomeScreen'),
      ),
    );
  }
}