import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taks_daily_app/components/components.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/router/router_provider.dart';
import 'package:taks_daily_app/core/router/router_provider.gr.dart';

@RoutePage()
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.blue100,
              AppColors.white100,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            gap68,
            Image.asset(AssetsApp.logo.path),
            const Spacer(),
            Padding(
              padding: padSy16,
              child: Column(
                children: [
                  ButtonPrimary(
                    onPressed: () =>
                        autoRouterPush(context, const RegisterScreenRoute()),
                    label: 'Registrarme',
                  ),
                  const SizedBox(height: 16),
                  ButtonSecondary(
                    onPressed: () => autoRouterPush(
                      context,
                      const AuthenticationScreenRoute(),
                    ),
                    label: 'Iniciar sesión',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
