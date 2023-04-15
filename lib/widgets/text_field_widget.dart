import 'package:flutter/material.dart';
import 'package:jangalma/helpers/utils.dart';

class TextFieldWidget extends StatelessWidget {
  final String currentText;
  final String label;
  final String type;
  final bool isActive;
  final String hintText;
  final Function onChanged;
  final bool isConfirmPasswordValid;

  const TextFieldWidget({
    required this.type,
    required this.label,
    required this.hintText,
    required this.onChanged,
    required this.currentText,
    this.isConfirmPasswordValid = false,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    Function validator = () => {};
    bool obscureText = false;
    TextInputType keyboardType;

    switch (type) {
      case "email":
        keyboardType = TextInputType.emailAddress;
        validator = validateEmail;
        break;
      case "phone":
        keyboardType = TextInputType.phone;
        break;
      case "text":
        keyboardType = TextInputType.text;
        validator = validateString;
        break;
      case "password":
        keyboardType = TextInputType.visiblePassword;
        validator = validatePassword;
        obscureText = true;
        break;
      default:
        keyboardType = TextInputType.text;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width*.9,
      child: TextFormField(
        scrollPadding: EdgeInsets.only(bottom: scrollPaddingBottom(context)),
        validator: (value) => validator(value),
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: (value) => onChanged(value),
        style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
          color: Colors.blue.shade800,
          fontWeight: isActive
            ? FontWeight.bold
            : FontWeight.normal
        ),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 1.0
            ),
          ),
          errorText: label == "Full name" || label == "Pseudo"
            ? validator(label, currentText, null)
            : label == "Confirm Password" && isConfirmPasswordValid
              ? "Entry is not equals to password"
              : validator(currentText, null),
          labelText: label,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade400
          ),
        ),
      ),
    );
  }
}