import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:taks_daily_app/components/components.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/router/router_provider.dart';
import 'package:taks_daily_app/core/utils/methods/toast_information.dart';
import 'package:taks_daily_app/presentation/register/register.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<RegisterVm>(
        create: (BuildContext screenContext) => RegisterVm(),
        child: Consumer<RegisterVm>(
          builder: (_, RegisterVm viewModel, __) => Scaffold(
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
                    '¡Crea tu cuenta y disfruta!',
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
                      if (viewModel.emailController.text.isEmpty ||
                          viewModel.passwordController.text.isEmpty) {
                        toastWarning('Por favor, complete todos los campos');
                        return;
                      }
                      unawaited(ProgressDialogo.showLoader(context));
                      await viewModel.registerUser(context);
                    },
                    label: 'Registrarme',
                  ),
                  gap24,
                  Text('O registrarse con', style: TextStyleApp.caption.gray),
                  gap16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: SvgPicture.asset(
                          AssetsApp.logoFbSvg.path,
                          width: 40,
                          height: 40,
                        ),
                      ),
                      InkWell(
                        child: SvgPicture.asset(
                          AssetsApp.logoGgSvg.path,
                          width: 40,
                          height: 40,
                        ),
                      ),
                      InkWell(
                        child: SvgPicture.asset(
                          AssetsApp.logoAppleSvg.path,
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                  gap24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿Ya tienes una cuenta? ',
                        style: TextStyleApp.caption.gray.w500,
                      ),
                      gap4,
                      InkWell(
                        onTap: () {
                          autoRouterPop(context);
                        },
                        child: Text(
                          'Iniciar sesión',
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
