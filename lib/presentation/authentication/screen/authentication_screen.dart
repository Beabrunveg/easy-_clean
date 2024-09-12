import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:taks_daily_app/components/components.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/router/router_provider.dart';
import 'package:taks_daily_app/core/router/router_provider.gr.dart';
import 'package:taks_daily_app/presentation/authentication/screen/vm/authentication_vm.dart';

@RoutePage()
class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<AuthenticationVm>(
        create: (BuildContext screenContext) => AuthenticationVm(),
        child: Consumer<AuthenticationVm>(
          builder: (_, AuthenticationVm viewModel, __) => Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: padSy16,
              child: Column(
                children: [
                  Image.asset(
                    AssetsApp.logoIcon.path,
                  ),
                  gap24,
                  const Text(
                    '¡Nos alegra verte de nuevo!',
                    style: TextStyleApp.h2Bold,
                  ),
                  gap16,
                  InputCustom(
                    controller: viewModel.emailController,
                    label: 'Email',
                    hint: 'Ingresa tu email',
                  ),
                  gap16,
                  InputCustom(
                    controller: viewModel.passwordController,
                    label: 'Contraseña',
                    hint: 'Ingresa tu contraseña',
                    obscureText: true,
                  ),
                  gap24,
                  ButtonPrimary(
                    onPressed: () async {
                      unawaited(ProgressDialogo.showLoader(context));
                      await viewModel.login(context);
                      ProgressDialogo.dissmiss(context);
                    },
                    label: 'Iniciar sesión',
                  ),
                  gap24,
                  Text('O inicia sesión con', style: TextStyleApp.caption.gray),
                  gap16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /*  InkWell(
                        child: SvgPicture.asset(
                          AssetsApp.logoFbSvg.path,
                          width: 40,
                          height: 40,
                        ),
                      ), */
                      InkWell(
                        onTap: () async {
                          final userCredentials =
                              await viewModel.signInWithGoogle();
                          if (userCredentials?.user != null) {
                            await viewModel.registerUser(
                              userCredentials?.user?.email ?? '',
                            );
                            autoRouterPushAndPopUntil(
                              context,
                              HomeScreenRoute(
                                email: userCredentials?.user?.email ?? '',
                              ),
                            );
                          }
                        },
                        child: SvgPicture.asset(
                          AssetsApp.logoGgSvg.path,
                          width: 40,
                          height: 40,
                        ),
                      ),
                      /* InkWell(
                        child: SvgPicture.asset(
                          AssetsApp.logoAppleSvg.path,
                          width: 40,
                          height: 40,
                        ),
                      ), */
                    ],
                  ),
                  gap24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿Aún no tienes una cuenta? ',
                        style: TextStyleApp.caption.gray.w500,
                      ),
                      gap4,
                      InkWell(
                        onTap: () {
                          autoRouterPop(context);
                        },
                        child: Text(
                          'Registrarse',
                          style: TextStyleApp.caption.w600.blue200,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
