import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:testovy_zadanie4/core/resources/resources.dart';
import 'package:testovy_zadanie4/core/theme/app_color.dart';
import 'package:testovy_zadanie4/core/theme/typography.dart';
import 'package:testovy_zadanie4/feature/app/router/app_path_route.dart';
import 'package:testovy_zadanie4/feature/profile_screen/UI/state/profile_state_page.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profilePageStateProvider);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Vectors.profile,
                  color: AppColors.black,
                  height: 100,
                ),
                const SizedBox(height: 10),
                Text(
                  profileState.nick,
                  style: AppTypography.boldEffect.copyWith(),
                ),
                const SizedBox(height: 10),
                Text(
                  profileState.email,
                  style: AppTypography.paragraphP1.copyWith(
                    color: AppColors.gray,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              context.go(AppRoute.authenticationRoute);
            },
            child: Container(
              color: AppColors.white,
              width: double.infinity,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Выйти',
                  style: AppTypography.paragraphP1.copyWith(
                    color: AppColors.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
