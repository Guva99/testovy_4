import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:testovy_zadanie4/core/service/app_data.dart';
import 'package:testovy_zadanie4/feature/app/app.dart';
import 'package:testovy_zadanie4/feature/app/router/app_path_route.dart';
import 'package:testovy_zadanie4/feature/app/router/error_screen.dart';
import 'package:testovy_zadanie4/feature/app/router/scaffold_with_nested_navigation.dart';
import 'package:testovy_zadanie4/feature/auth_page/ui/page/auth_page.dart';
import 'package:testovy_zadanie4/feature/favorite_screen/UI/page/favorite_page.dart';
import 'package:testovy_zadanie4/feature/map_screen/UI/page/map_screen.dart';
import 'package:testovy_zadanie4/feature/news_feed_screen/UI/page/news_feed_screen.dart';
import 'package:testovy_zadanie4/feature/profile_screen/UI/page/profile_screen.dart';

class MainRouteApp extends StatelessWidget {
  const MainRouteApp({Key? key}) : super(key: key);

  String getInitPath() {
    if (appData.accessToken != '') {
      return AppRoute.homeScreenRoute;
    } else {
      return AppRoute.authenticationRoute;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(builder: (context, ref, child) {
        final _rootNavigatorKey = GlobalKey<NavigatorState>();
        final _shellNavigatorNewsFeedScreenKey = GlobalKey<NavigatorState>(debugLabel: 'shellHomeScreen');
        final _shellNavigatorMapScreenKey = GlobalKey<NavigatorState>(debugLabel: 'shellMapScreen');
        final _shellNavigatorFavoriteScreenKey = GlobalKey<NavigatorState>(debugLabel: 'shellFavoriteScreen');
        final _shellNavigatorProfileScreenKey = GlobalKey<NavigatorState>(debugLabel: 'shellProfileScreen');
        final goRouter = GoRouter(
            initialLocation: getInitPath(),
            navigatorKey: _rootNavigatorKey,
            debugLogDiagnostics: true,
            routes: [
              ///Other Routes
              GoRoute(
                path: AppRoute.authenticationRoute,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: AuthenticationScreen(),
                ),
              ),
              // GoRoute(
              //   path: AppRoute.registerPhoneRoute,
              //   pageBuilder: (context, state) => const NoTransitionPage(
              //     child: RegisterScreen(),
              //   ),
              // ),
              StatefulShellRoute.indexedStack(
                  builder: (context, state, navigationShell) {
                    return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
                  },
                  branches: [
                    ///****+*[NewsFeedScreen MENU]*****///
                    StatefulShellBranch(
                      navigatorKey: _shellNavigatorNewsFeedScreenKey,
                      routes: [
                        GoRoute(
                          path: AppRoute.homeScreenRoute,
                          pageBuilder: (context, state) => const NoTransitionPage(
                            child: NewsFeedScreen(),
                          ),
                        ),
                      ],
                    ),

                    ///****+*[MapScreen MENU]*****///
                    StatefulShellBranch(
                      navigatorKey: _shellNavigatorMapScreenKey,
                      routes: [
                        GoRoute(
                          path: AppRoute.mapScreenRoute,
                          pageBuilder: (context, state) => const NoTransitionPage(
                            child: MapScreen(),
                          ),
                        ),
                      ],
                    ),

                    ///****+*[Favorite  MENU]*****///
                    StatefulShellBranch(
                      navigatorKey: _shellNavigatorFavoriteScreenKey,
                      routes: [
                        GoRoute(
                          path: AppRoute.favoriteScreenRoute,
                          pageBuilder: (context, state) => const NoTransitionPage(
                            child: FavoritePage(),
                          ),
                        ),
                      ],
                    ),

                    ///****+*[PROFILE MENU]*****///
                    StatefulShellBranch(
                      navigatorKey: _shellNavigatorProfileScreenKey,
                      routes: [
                        GoRoute(
                          path: AppRoute.profileScreenRoute,
                          pageBuilder: (context, state) => const NoTransitionPage(
                            child: ProfileScreen(),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ],
            errorBuilder: ((context, state) => const ErrorScreen()));
        return App(goRouter: goRouter);
      }),
    );
  }
}
