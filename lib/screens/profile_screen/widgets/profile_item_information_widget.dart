import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return CardItemContainerWidget(
      borderColor: borderColor,
      backgroundColor: backgroundColor,
      isSmall: !editInput,
      widget: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Row(
         children: [
            SizedBox(width: MediaQuery.of(context).size.width*.01),
            FaIcon(icon),
            SizedBox(width: MediaQuery.of(context).size.width*.05),
            content(context, editInput),
          ],
        ),
      )
    );
  }

  Column content(BuildContext context, bool edit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade600)
        ),
        edit
         ? Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: MediaQuery.of(context).size.width*.7,            
            child: TextField(
              keyboardType: TextInputType.text,
              onChanged: (value) => onChanged(value),
              decoration: InputDecoration(
                hintText: text,
                border: const OutlineInputBorder(),
              ),
            ),
         )
         : Text(text, style: const TextStyle(fontWeight: FontWeight.bold))
      ],
    );
  }
}
