part of 'splash_cubit.dart';

@immutable
abstract class SplashState {
  const SplashState();
}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {
  const SplashLoading();
}

class SplashCompleted extends SplashState {}
