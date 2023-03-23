
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jangalma/providers/navigation_provider.dart';

class BottomNavigationBarWidget extends HookWidget {
  const BottomNavigationBarWidget();

  @override
  Widget build(BuildContext context) {
    final navController = useProvider(navigationBarProvider);

    return Consumer(
      builder: (context, ref, child){
        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade200
              )
            )
          ),
          child: BottomNavigationBar(
            iconSize: 30,
            items: <BottomNavigationBarItem>[
              item(context, Icons.home, 0, navController.getIndex),
              item(context, Icons.settings, 1, navController.getIndex)
            ],
            currentIndex: navController.getIndex,
            selectedItemColor: Theme.of(context).iconTheme.color,
            unselectedItemColor: const Color.fromRGBO(158, 158, 158, 1),
            onTap: (index){
              if(navController.getIndex!= index){
                navController.setIndex(index);
              }
            },
          ),
        );
      }
    );
  }

  BottomNavigationBarItem item(BuildContext context, IconData icon, int index, int currentIndex) {

    return BottomNavigationBarItem(
      icon: FaIcon(icon),
      label: ''
    );
  }
}