import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:silver_heart_buy/repository/repositories.dart';
import 'package:silver_heart_buy/firebase_options.dart';
import 'package:silver_heart_buy/bloc/bloc.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final authCubit = Authcubit(AuthRepoImp());
  EquatableConfig.stringify = true;
  runApp(
    BlocProvider(
      create: (_) => authCubit..init(),
      child: MyApp.create(),
    )
  );
}