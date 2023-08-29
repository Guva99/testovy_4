import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:testovy_zadanie4/core/theme/app_color.dart';
import 'package:testovy_zadanie4/feature/profile_screen/UI/state/manager.dart';

class App extends ConsumerStatefulWidget {
  const App({
    super.key,
    required this.goRouter,
  });

  final GoRouter goRouter;

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    ref.read(authManagerProvider)
      ..email()
      ..nick();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: widget.goRouter,
      theme: ThemeData.light(),
      darkTheme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(color: AppColors.purpleBlue),
          unselectedIconTheme: IconThemeData(color: AppColors.black),
        ),
      ),
    );
  }
}
