import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jangalma/screens/home_screen/viewmodels/home_viewmodel.dart';
import 'package:jangalma/widgets/card_item_container_widget.dart';
import 'package:jangalma/screens/home_screen/widgets/card_item_home_widget.dart';
import 'package:jangalma/screens/home_screen/widgets/home_content.dart';

import 'package:jangalma/services/firebase_firestore_api_service.dart';
import 'package:jangalma/widgets/bottom_navigation_bar_widget.dart';
import 'package:jangalma/widgets/image_widget.dart';
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

    return OverrideBackButtonWrapperWidget(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width:  MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [              
              const HomeTopCard(),
              SizedBox(height: MediaQuery.of(context).size.height*0.005),
              const HomePublicity(),                 
              HomeContentWidget(widgets: widgets),
            ],
          ),
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
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
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

class HomeTopCard extends StatelessWidget {
  const HomeTopCard();

  @override
  Widget build(BuildContext context) {
    const String image = "https://cdn.pixabay.com/photo/2017/02/16/23/10/smile-2072907_1280.jpg";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("WELCOME", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/profile'),
              child: const ImageWidget(src: image, sizeIcon: 1)
            )
          ],
        ),
      ),
    );
  }
}