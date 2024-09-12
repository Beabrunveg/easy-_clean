part of 'router_provider.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.custom(
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      );

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashScreenRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: WelcomeScreenRoute.page,
        ),
        AutoRoute(
          page: RegisterScreenRoute.page,
        ),
        AutoRoute(
          page: AuthenticationScreenRoute.page,
        ),
        AutoRoute(
          page: HomeScreenRoute.page,
        ),
        AutoRoute(
          page: ProfileScreenRoute.page,
        ),
        AutoRoute(
          page: ConfigurationScreenRoute.page,
        ),
        AutoRoute(
          page: PhotoCompleterScreenRoute.page,
        ),
        AutoRoute(
          page: MyInventoryScreenRoute.page,
        ),
        AutoRoute(page: AddInventoryScreenRoute.page),
      ];
}
