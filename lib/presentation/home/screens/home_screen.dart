import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:silver_heart_buy/bloc/bloc.dart';
import 'package:silver_heart_buy/theme/app_theme.dart';
import 'package:silver_heart_buy/presentation/screens.dart';
import 'package:silver_heart_buy/repository/repositories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBloc(UserRepoImp())..getUser(),
      child: const HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          if (state is UserStateSuccess) {
            return PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const FeedScreen(),
                SearchScreen(user: state.user),
                const ProfileScreen(),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: Colors.black),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          currentPage = index;
          _pageController.animateToPage(
            currentPage,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInCirc
          );
          setState(() {});
        },
        backgroundColor: AppTheme.primaryColor,
        selectedItemColor: AppTheme.thirdColor,
        unselectedItemColor: AppTheme.secondaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search_outlined),
            label: "Usuarios y Locales"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Perfil"
          ),
        ],
      ),
    );
  }
}
