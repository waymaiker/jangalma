import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jangalma/services/firebase_firestore_api_service.dart';

import 'package:jangalma/screens/home_screen/widgets/home_top_card_widget.dart';
import 'package:jangalma/screens/home_screen/viewmodels/home_viewmodel.dart';
import 'package:jangalma/screens/home_screen/widgets/card_item_home_widget.dart';
import 'package:jangalma/screens/home_screen/widgets/home_content.dart';

import 'package:jangalma/widgets/card_item_container_widget.dart';
import 'package:jangalma/widgets/override_back_button_wrapper_widget.dart';

class HomeScreen extends HookWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    final viewmodel = useProvider(homeViewModelProvider);

    useEffect((){
      viewmodel.init(getQuizFromFirebase());
    }, []);

    List<Widget> widgets = List.generate(
      viewmodel.contentList.length,
      (index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: CardItemHomeScreenWidget(
          id: viewmodel.contentList[index]["id"],
          name: viewmodel.contentList[index]["name"],
          image: viewmodel.contentList[index]["image"],
          level: viewmodel.contentList[index]["level"],
          numberOfQuestions: viewmodel.contentList[index]["numberOfQuestions"],
        ),
      ),
    );

    SliverAppBar silverPageBar(BuildContext context) {
      return const SliverAppBar(
        pinned: false,
        snap: false,
        floating: true,
        title: HomeTopCard(),
      );
    }

    return OverrideBackButtonWrapperWidget(
      child: Scaffold(
        body: Platform.isIOS
          ? CustomScrollView(
              slivers: [
                silverPageBar(context),
                HomeContentWidget(widgets: widgets)
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const HomeTopCard(),
                HomeContentWidget(widgets: widgets),
              ],
            ),
      )
    );
  }
}

class HomePublicity extends StatelessWidget {
  const HomePublicity();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 6.0
        ),
        child: CardItemContainerWidget(
          widget: Container(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/backtoafrica.png'),
          ),
        ),
      ),
    );
  }
}