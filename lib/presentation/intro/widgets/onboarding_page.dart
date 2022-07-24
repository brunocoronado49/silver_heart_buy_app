import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:silver_heart_buy/bloc/bloc.dart';
import 'package:silver_heart_buy/presentation/intro/widgets/auth_page.dart';
import 'package:silver_heart_buy/presentation/intro/widgets/description_page.dart';
import 'package:silver_heart_buy/theme/app_theme.dart';

class OnBoardingPage extends HookWidget {
  const OnBoardingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isSigninIn = context.watch<Authcubit>().state is AuthStateLoading;

    return AbsorbPointer(
      absorbing: isSigninIn,
      child: PageIndicatorContainer(
        align: IndicatorAlign.bottom,
        length: 4,
        indicatorSpace: 12,
        indicatorColor: AppTheme.thirdColor,
        indicatorSelectorColor: AppTheme.secondaryColor,
        child: PageView(
          controller: usePageController(),
          children: const [
            DescriptionPage(
              text: "Silver Heart el lugar perfecto donde podrás encontrar productos de platería.",
              imagePath: 'assets/onBoardingOne.png',
              title: "Silver Heart",
            ),
            DescriptionPage(
              text: "Puedes ver todos los productos que los locales publiquen.",
              imagePath: 'assets/onBoardingTwo.png',
              title: "Revisa y mantente al tanto",
            ),
            DescriptionPage(
              text: "Aprovecha esta aplicación para checar los ultimos productos de plata desde donde quieras.",
              imagePath: 'assets/onBoardingThree.png',
              title: "Desde tu casa",
            ),
            AuthPage(),
          ],
        ),
      ),
    );
  }
}