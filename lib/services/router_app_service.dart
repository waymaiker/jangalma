import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:jangalma/screens/home_screen/home_screen.dart';
import 'package:jangalma/screens/login_screen/login_screen.dart';
import 'package:jangalma/screens/quiz_screen/quiz_screen.dart';
import 'package:jangalma/screens/profile_screen/profile_screen.dart';
import 'package:jangalma/screens/ranking_screen/ranking_screen.dart';
import 'package:jangalma/screens/signup_screen/signup_screen.dart';
import 'package:jangalma/widgets/fade_transition_widget.dart';

class ScreenPaths {
  static String login = '/';
  static String home = '/home';
  static String quiz = '/quiz';
  static String signup = '/signup';
  static String ranking = '/ranking';
  static String profile = '/profile';
}

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    AppRoute(ScreenPaths.signup, (_) => const SignUpScreen(), useFade: true),
    AppRoute(ScreenPaths.home, (_) => const HomeScreen(), useFade: true),
    AppRoute(ScreenPaths.quiz, (_) => const QuizScreen(), useFade: true),
    AppRoute(ScreenPaths.login, (_) => const LogInScreen(), useFade: true),
    AppRoute(ScreenPaths.ranking, (_) => const RankingScreen(), useFade: true),
    AppRoute(ScreenPaths.profile, (_) => const ProfileScreen(), useFade: true),
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
              return FadeTransitionWidget(child: child);
            },
          );
        }
        return CupertinoPage(child: pageContent);
      },
    );
  final bool useFade;
}