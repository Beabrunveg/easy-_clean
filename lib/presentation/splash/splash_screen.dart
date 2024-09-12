import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/router/router.dart';
import 'package:taks_daily_app/core/router/router_provider.gr.dart';
import 'package:taks_daily_app/src/services/services_google/sign_in_with_google.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _authService = AuthService();
  @override
  void initState() {
    _authService.checkUserSession(context).then((user) {
      if (user != null) {
        Future.delayed(
          const Duration(milliseconds: 1500),
          () => autoRouterPushAndPopUntil(
            context,
            HomeScreenRoute(email: user.email ?? ''),
          ),
        );
      } else {
        Future.delayed(
          const Duration(milliseconds: 1500),
          () => autoRouterPushAndPopUntil(
            context,
            const WelcomeScreenRoute(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white100,
      body: Center(
        child: Column(
          children: [
            Image.asset(
              AssetsApp.logo.path,
              color: AppColors.black,
            ),
            const CircularProgressIndicator(
              color: AppColors.blue100,
            ),
            const SizedBox(height: 16),
            Text('Cargando...', style: TextStyleApp.h2Bold.black),
          ],
        ),
      ),
    );
  }
}
