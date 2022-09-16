import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neyasischallenge/core/extension/context_extension.dart';
import 'package:neyasischallenge/features/splash/cubit/splash_cubit.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit(),
      child: Scaffold(
        backgroundColor: context.theme.errorColor,
        body: BlocConsumer<SplashCubit, SplashState>(
            listener: (context, state) {},
            builder: (context, state) => state is SplashInitial
                ? const SizedBox.expand()
                : state is SplashLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : state is SplashCompleted
                        ? const SizedBox.expand()
                        : const SizedBox.expand()),
      ),
    );
  }
}
