import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taks_daily_app/components/components.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/router/router_provider.dart';
import 'package:taks_daily_app/core/router/router_provider.gr.dart';
import 'package:taks_daily_app/presentation/home/home.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({
    required this.email,
    required this.homeVm,
    super.key,
  });

  final String email;
  final HomeVm homeVm;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ColoredBox(
        color: AppColors.blue50.withOpacity(.1),
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.blue200,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.menu_open_rounded,
                          color: AppColors.white,
                          size: 30,
                        ),
                        space8,
                        Text(
                          'Menu',
                          style: TextStyleApp.h1Header.white.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        await homeVm.createMokeData('1-8-2024', false);
                        await homeVm.createMokeData('2-8-2024', false);
                        await homeVm.createMokeData('3-8-2024', false);
                        await homeVm.createMokeData('4-8-2024', false);
                        await homeVm.createMokeData('5-8-2024', false);
                        await homeVm.createMokeData('6-8-2024', false);
                        await homeVm.createMokeData('7-8-2024', false);
                        await homeVm.createMokeData('8-8-2024', false);
                        await homeVm.createMokeData('9-8-2024', false);
                        await homeVm.createMokeData('10-8-2024', false);
                        await homeVm.createMokeData('11-8-2024', false);
                        await homeVm.createMokeData('12-8-2024', false);
                        await homeVm.createMokeData('13-8-2024', false);
                        await homeVm.createMokeData('14-8-2024', false);
                        await homeVm.createMokeData('15-8-2024', false);
                        await homeVm.createMokeData('16-8-2024', false);
                        await homeVm.createMokeData('17-8-2024', false);
                        await homeVm.createMokeData('18-8-2024', false);
                        await homeVm.createMokeData('19-8-2024', false);
                        await homeVm.createMokeData('20-8-2024', false);
                        await homeVm.createMokeData('21-8-2024', false);
                        await homeVm.createMokeData('22-8-2024', false);
                      },
                      child: Image.asset(
                        AssetsApp.logoIcon.path,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => autoRouterPop(context),
              child: Container(
                padding: padSy16,
                margin: padSy16,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      AssetsApp.menu.path,
                      width: 30,
                      height: 30,
                    ),
                    space8,
                    const Text(
                      'Tareas',
                      style: TextStyleApp.h2,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => autoRouterPush(
                context,
                ProfileScreenRoute(
                  email: email,
                  homeVm: homeVm,
                ),
              ),
              child: Container(
                padding: padSy16,
                margin: padSy16,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AssetsApp.userSvg.path,
                      width: 26,
                      height: 26,
                    ),
                    space12,
                    const Text(
                      'Mi perfil',
                      style: TextStyleApp.h2,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () =>
                  autoRouterPush(context, const ConfigurationScreenRoute()),
              child: Container(
                padding: padSy16,
                margin: padSy16,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AssetsApp.settingSvg.path,
                      width: 26,
                      height: 26,
                    ),
                    space8,
                    const Text(
                      'Configuración',
                      style: TextStyleApp.h2,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: padSy16,
                child: ButtonTertiary(
                  onPressed: () async {
                    await homeVm.getAuthService.signOut();
                    autoRouterPushAndPopUntil(
                      context,
                      const WelcomeScreenRoute(),
                    );
                  },
                  label: 'Cerrar sesión',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
