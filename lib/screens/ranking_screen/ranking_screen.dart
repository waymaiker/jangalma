import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jangalma/services/firebase_firestore_api_service.dart';
import 'package:jangalma/screens/ranking_screen/viewmodels/ranking_viewmodel.dart';
import 'package:jangalma/screens/ranking_screen/widgets/card_item_widget.dart';
import 'package:jangalma/screens/ranking_screen/widgets/ranking_content_widget.dart';
import 'package:jangalma/widgets/override_back_button_wrapper_widget.dart';
import 'package:jangalma/widgets/topbar_widget.dart';

class RankingScreen extends HookWidget {
  const RankingScreen();

  @override
  Widget build(BuildContext context) {
    final viewmodel = useProvider(rankingViewModelProvider);

    useEffect((){
      viewmodel.init(getLeadboardFromFirebase());
    }, []);

    List<Widget> widgets = List.generate(
      viewmodel.contentList.length > 7 ? 7 : viewmodel.minimalList.length+viewmodel.contentList.length,
      (index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: CardItemWidget(
          userImage: viewmodel.contentList[index]["userImage"]!,
          userPseudo: viewmodel.contentList[index]["userPseudo"]! ,
          userPoints: viewmodel.contentList[index]["userPoints"]! ,
          userRank: viewmodel.contentList[index]["userRank"]! ,
        ),
      ),
    );

    List<Widget> minimalCards = List.generate(
      viewmodel.minimalList.length,
      (index) => Padding(
        padding: EdgeInsets.only(
          top: index+1 == 2 ? 6.0 : 16.0,
          left:8.0,
          right:8.0,
          bottom: index+1 == 2 ? 14.0 : 8.0,
        ),
        child: CardItemWidget(
          isMinimal: true,
          userImage: viewmodel.minimalList[index]["userImage"]!,
          userPseudo: viewmodel.minimalList[index]["userPseudo"]!,
          userPoints: viewmodel.minimalList[index]["userPoints"]!,
          userRank: viewmodel.minimalList[index]["userRank"]!,
        ),
      ),
    );

    return OverrideBackButtonWrapperWidget(
      child: Column(
        children: [
          const TopBarWidget(text: "LEADBOARD"),
          RankingContentWidget(
            minimalCards: minimalCards,
            widgets: widgets
          ),
        ],
      )
    );
  }
}