import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jangalma/services/firebase_firestore_api_service.dart';
import 'package:jangalma/services/router_app_service.dart';

import 'package:jangalma/providers/themes_provider.dart';
import 'package:jangalma/screens/quiz_screen/viewmodels/quiz_viewmodel.dart';

class AppWrapper extends HookWidget {
  const AppWrapper();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.bottom,
      ],
    );

    final themeController = useProvider(themeProvider);
    final quizViewModel = useProvider(quizViewModelProvider);

    useEffect((){
      quizViewModel.initViewModel(
        getQuestionsFromFirebse(),
        getFeedbackFromFirebase()
      );
    }, []);

    return MaterialApp.router(
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
      routerDelegate: appRouter.routerDelegate,
      themeMode: themeController.getCurrentTheme(),
      theme: ThemeData.light().copyWith(
        primaryColor: themeController.getLightTheme.primaryColor,
        primaryTextTheme: themeController.getLightTheme.primaryTextTheme,
        colorScheme: themeController.getLightTheme.colorScheme
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: themeController.getDarkTheme.primaryColor,
        primaryTextTheme: themeController.getDarkTheme.primaryTextTheme,
        colorScheme: themeController.getDarkTheme.colorScheme
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}