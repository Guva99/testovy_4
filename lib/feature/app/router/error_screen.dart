import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:testovy_zadanie4/core/theme/style.dart';
import 'package:testovy_zadanie4/core/theme/typography.dart';
import 'package:testovy_zadanie4/feature/app/router/app_path_route.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Страница не найдено',
            style: AppTypography.h4,
          ),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Lottie.asset(
              'assets/lottie/404.json',
              fit: BoxFit.contain,
              repeat: true,
              height: 150,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              style: AppButtonStyle.primaryStyleBlue,
              onPressed: () {
                context.go(AppRoute.homeScreenRoute);
              },
              child: Text('На Главную'),
            ),
          )
        ],
      ),
    );
  }
}
