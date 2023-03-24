import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:jangalma/screens/home_screen/home_screen.dart';
import 'package:jangalma/screens/login_screen/login_screen.dart';
import 'package:jangalma/screens/quiz_screen/quiz_screen.dart';
import 'package:jangalma/screens/profile_screen/profile_screen.dart';
import 'package:jangalma/screens/ranking_screen/ranking_screen.dart';

class ScreenPaths {
  static String login = '/';
  static String home = '/home';
  static String quiz = '/quiz';
  static String ranking = '/ranking';
  static String profile = '/profile';
}

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    AppRoute(ScreenPaths.login, (_) => const LogInScreen()),
    AppRoute(ScreenPaths.home, (_) => const HomeScreen()),
    AppRoute(ScreenPaths.quiz, (_) => const QuizScreen()),
    AppRoute(ScreenPaths.ranking, (_) => const RankingScreen()),
    AppRoute(ScreenPaths.profile, (_) => const ProfileScreen()),
  ],
);

class AppRoute extends GoRoute {
  AppRoute(
    String path,
    Widget Function(GoRouterState s) builder,
    {List<GoRoute> routes = const [], this.useFade = false}
  ) : super(
      path: path,
      routes: routes,
      pageBuilder: (context, state) {
        final pageContent = Scaffold(
          body: builder(state),
          resizeToAvoidBottomInset: false,
        );
        if (useFade) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: pageContent,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        }
        return CupertinoPage(child: pageContent);
      },
    );
  final bool useFade;
}