// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    AccountsRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const AccountsView(),
      );
    },
    AddOrUpdateAccountRoute.name: (routeData) {
      final args = routeData.argsAs<AddOrUpdateAccountRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: AddOrUpdateAccountView(
          key: args.key,
          model: args.model,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        RouteConfig(
          AccountsRoute.name,
          path: '/accounts',
        ),
        RouteConfig(
          AddOrUpdateAccountRoute.name,
          path: '/add-or-update-account',
        ),
      ];
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [AccountsView]
class AccountsRoute extends PageRouteInfo<void> {
  const AccountsRoute()
      : super(
          AccountsRoute.name,
          path: '/accounts',
        );

  static const String name = 'AccountsRoute';
}

/// generated route for
/// [AddOrUpdateAccountView]
class AddOrUpdateAccountRoute
    extends PageRouteInfo<AddOrUpdateAccountRouteArgs> {
  AddOrUpdateAccountRoute({
    Key? key,
    required AccountResponseModel? model,
  }) : super(
          AddOrUpdateAccountRoute.name,
          path: '/add-or-update-account',
          args: AddOrUpdateAccountRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'AddOrUpdateAccountRoute';
}

class AddOrUpdateAccountRouteArgs {
  const AddOrUpdateAccountRouteArgs({
    this.key,
    required this.model,
  });

  final Key? key;

  final AccountResponseModel? model;

  @override
  String toString() {
    return 'AddOrUpdateAccountRouteArgs{key: $key, model: $model}';
  }
}
