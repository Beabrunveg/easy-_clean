import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taks_daily_app/core/router/router_provider.dart';
import 'package:taks_daily_app/flavors.dart';
import 'package:taks_daily_app/presentation/changed_theme.dart';

final appRouter = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: F.title,
            themeMode:
                themeNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            locale: DevicePreview.locale(context),
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            builder: (BuildContext context, Widget? child) =>
                DevicePreview.appBuilder(
              context,
              _flavorBanner(
                child: child!,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              location: BannerLocation.bottomEnd,
              message: F.name,
              color: Colors.green.withOpacity(0.6),
              textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                letterSpacing: 1,
              ),
              textDirection: TextDirection.ltr,
              child: child,
            )
          : Container(
              child: child,
            );
}
