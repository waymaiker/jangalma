import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function action;
  final String title;
  final String type;
  final Color enabledBackgroundColor;
  final Color enabledShadowColor;
  final Color enabledTextColor;
  final Color disabledBackgroundColor;
  final Color disabledShadowColor;
  final Color disabledTextColor;
  final bool expanded;

  const ButtonWidget({
    required this.action,
    this.enabledBackgroundColor = const Color.fromRGBO(255, 222, 89, 1),
    this.enabledShadowColor = const Color.fromRGBO(251, 192, 45, 1),
    this.enabledTextColor = const Color.fromRGBO(255, 255, 255, 1),
    this.disabledBackgroundColor = const Color.fromRGBO(255, 245, 157, 1),
    this.disabledShadowColor = const Color.fromRGBO(251, 192, 45, 1),
    this.disabledTextColor =  const Color.fromRGBO(255, 222, 89, 1),
    this.type = "default",
    this.title = "VALIDER",
    this.expanded = true
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color shawdowColor;
    Color textColor;
    double width = expanded ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width*.8;
    double buttonBorderRadius = 10;
    double buttonBorderWidth = 1;
    double blurRadius = 3;
    double offSetDy = 4;

    switch (type) {
      case 'enabled':
        backgroundColor = enabledBackgroundColor;
        shawdowColor = enabledShadowColor;
        textColor = enabledTextColor;
        break;
      case 'goodAnswer':
        backgroundColor =Colors.green.shade400;
        shawdowColor =Colors.green.shade600;
        textColor = Colors.white;
        break;
      case 'wrongAnswer':
        backgroundColor =Colors.red.shade400;
        shawdowColor =Colors.red.shade600;
        textColor = Colors.white;
        break;
      case 'other':
        backgroundColor = Colors.grey.shade400;
        shawdowColor = Colors.grey.shade600;
        textColor = Colors.white;
        break;
      default:
        backgroundColor = disabledBackgroundColor;
        shawdowColor = disabledShadowColor;
        textColor = disabledTextColor;
        break;
    }

    return  Padding(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onTap: () => action(),
        child: Container(
          height: MediaQuery.of(context).size.height*0.06,
          width: width,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              width: buttonBorderWidth,
              color: backgroundColor
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(buttonBorderRadius)
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: shawdowColor,
                blurRadius: blurRadius,
                offset: Offset(0.0, offSetDy),
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.bold
              ),
            )
          ),
        ),
      ),
    );
  }  
}