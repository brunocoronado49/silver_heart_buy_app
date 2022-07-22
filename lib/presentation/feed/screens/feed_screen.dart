import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:silver_heart_buy/bloc/bloc.dart';
import 'package:silver_heart_buy/presentation/widgets.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: ((context, state) {
        if (state is UserStateSuccess) {
          return SafeArea(
            child: ListView(
              children: [
                const FeedHeader(),
                const HeaderTitle(title: "Otros usuarios"),
                UserItems(user: state.user),
                const Divider(height: 30),
                const HeaderTitle(title: "Productos"),
                PostItems(user: state.user),
              ],
            ),
          );
        }
        return const Center(
          child: SizedBox(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(
              color: Colors.black
            ),
          ),
        );
      }),
    );
  }
}
