import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:neyasischallenge/core/constants/navigation/navigation_constants.dart';
import 'package:neyasischallenge/features/accounts/view/accounts_view.dart';
import 'package:neyasischallenge/features/add_or_update_account/model/account_response_model.dart';
import 'package:neyasischallenge/features/add_or_update_account/view/add_or_update_account_view.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    //BottomNavigation Bar Router Settings
    AutoRoute(
      page: AccountsView,
      path: NavigationConstants.ACCOUNTS,
      initial: true,
    ),
    AutoRoute(
      page: AddOrUpdateAccountView,
      path: NavigationConstants.ADD_OR_UPDATE_ACCOUNT,
    ),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
