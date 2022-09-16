import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:neyasischallenge/core/init/router/app_router.dart';
import 'package:neyasischallenge/core/service/locator/locator.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()) {
    nextRoute();
  }

  Future<void> nextRoute() async {
    emit(const SplashLoading());
    await Future.delayed(const Duration(seconds: 2), (() {
      emit(SplashCompleted());
      getIt<AppRouter>().pushAndPopUntil(const AccountsRoute(), predicate: (_) => false);
    }));
  }
}
