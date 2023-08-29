import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testovy_zadanie4/core/resources/resources.dart';
import 'package:testovy_zadanie4/core/theme/app_color.dart';


class ScaffoldWithNavigationBar extends ConsumerWidget {
  const ScaffoldWithNavigationBar({
    Key? key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: body,
      bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: TextStyle(
            color: AppColors.gray,
          ),
          selectedLabelStyle: TextStyle(
            color: AppColors.purpleBlue,
          ),
          unselectedItemColor: AppColors.black,
          selectedItemColor: AppColors.purpleBlue,
          backgroundColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: onDestinationSelected,
          items: [
            buildNavigationBarItem(
              Vectors.lenta,
            'Лента',
              0,
            ),
            buildNavigationBarItem(
              Vectors.map,
              'Карта',
              1,
            ),
            buildNavigationBarItem(
              Vectors.favorite,
              'Избранные',
              2,
            ),
            buildNavigationBarItem(
              Vectors.profile,
              'Профиль',
              3,
            ),
          ]),
    );
  }

  BottomNavigationBarItem buildNavigationBarItem(
    String imageAsset,
    String label,
    int index,
  ) {
    final isActive = selectedIndex == index;
    final color = isActive ? AppColors.purpleBlue : Colors.black;
    return BottomNavigationBarItem(
      icon: InkWell(
          onTap: () => onDestinationSelected(index),
          child: SvgPicture.asset(imageAsset, height: index == 1 ? 30 : 35, width: index == 1 ? 30 : 35, color: color)),
      label: label,
    );
  }
}
