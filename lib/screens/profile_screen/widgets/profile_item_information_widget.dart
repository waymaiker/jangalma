import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:jangalma/helpers/utils.dart';
import 'package:jangalma/widgets/card_item_container_widget.dart';

class ProfileItemInformationWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final String label;
  final int borderColor;
  final int backgroundColor;
  final bool editInput;
  final Function onChanged;

  const ProfileItemInformationWidget({
    required this.text,
    required this.label,
    required this.icon,
    required this.borderColor,
    required this.backgroundColor,
    required this.onChanged,
    this.editInput = false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CardItemContainerWidget(
        borderColor: borderColor,
        backgroundColor: backgroundColor,
        isSmall: !editInput,
        widget: Padding(
         padding: Platform.isIOS
          ? const EdgeInsets.all(2.0)
          : const EdgeInsets.all(15.0),
         child: Row(
           children: [
              SizedBox(width: MediaQuery.of(context).size.width*.04),
              FaIcon(icon),
              SizedBox(width: MediaQuery.of(context).size.width*.05),
              content(context, editInput),
            ],
          ),
        )
      ),
    );
  }

  Column content(BuildContext context, bool edit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        edit
          ? Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              width: MediaQuery.of(context).size.width*.7,
              child: TextFormField(
                scrollPadding: EdgeInsets.only(bottom: scrollPaddingBottom(context)),
                keyboardType: TextInputType.text,
                onChanged: (value) => onChanged(value),
                decoration: InputDecoration(
                  hintText: text,
                ),
              ),
            )
          : Text(text, style: const TextStyle(fontWeight: FontWeight.bold))
      ],
    );
  }
}
