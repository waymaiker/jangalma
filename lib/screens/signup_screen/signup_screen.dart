import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jangalma/screens/signup_screen/viewmodels/signup_viewmodel.dart';
import 'package:jangalma/widgets/button_widget.dart';
import 'package:jangalma/widgets/text_field_widget.dart';
import 'package:jangalma/widgets/text_widget.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen();

  @override
  Widget build(BuildContext context) {
    final viewmodel = useProvider(signupViewModelProvider);

    useEffect((){
      viewmodel.init();
    }, []);

    useEffect((){},[
      viewmodel.user.fullName,
      viewmodel.user.pseudoTag,
      viewmodel.user.email,
      viewmodel.user.password,
      viewmodel.confirmPassword,
      viewmodel.isConditionAccetped
    ]);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*.85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    text: 'Sign In',
                    type: 'headlineLarge',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  TextFieldWidget(
                    currentText: viewmodel.user.fullName,
                    label: "Full name",
                    hintText: "Full name",
                    type: 'text',
                    onChanged: viewmodel.setfullName,
                    isActive: viewmodel.user.fullName.isNotEmpty,
                  ),
                  TextFieldWidget(
                    currentText: viewmodel.user.pseudoTag,
                    label: "Pseudo",
                    hintText: "Pseudo",
                    type: 'text',
                    onChanged: viewmodel.setPseudoTag,
                    isActive: viewmodel.user.pseudoTag.isNotEmpty,
                  ),
                  TextFieldWidget(
                    currentText: viewmodel.user.email,
                    label: "E-Mail",
                    hintText: "Enter an email",
                    type: 'email',
                    onChanged: viewmodel.setEmail,
                    isActive:  viewmodel.user.email.isNotEmpty,
                  ),
                  TextFieldWidget(
                    currentText: viewmodel.user.password,
                    label: "Password",
                    hintText: "Enter your password",
                    type: 'password',
                    onChanged: viewmodel.setPassword,
                    isActive: viewmodel.user.password.isNotEmpty,
                  ),
                  TextFieldWidget(
                    currentText: viewmodel.confirmPassword,
                    label: "Confirm Password",
                    hintText: "Enter your confirmation password",
                    type: 'password',
                    onChanged: viewmodel.setConfirmPassword,
                    isActive: viewmodel.confirmPassword.isNotEmpty,
                    isConfirmPasswordValid: viewmodel.isConfirmPasswordValid(),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.01),
                  Row(
                    children: [
                      Checkbox(
                        value: viewmodel.isConditionAccetped,
                        onChanged: (value) => viewmodel.setConditions(),
                      ),
                      TextWidget(
                        text: "By checking this checkbox, you are certifiying \n that you read and agree to the E-Sign",
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01),
            ButtonWidget(
              type: viewmodel.isFormValid() ? 'enabled' : 'default',
              disabledBackgroundColor: Theme.of(context).colorScheme.secondary,
              enabledBackgroundColor: Theme.of(context).colorScheme.primary,
              disabledTextColor: Colors.grey.shade300,
              title: "Continue",
              action: () => {
                  viewmodel.createAccount(),
                if(viewmodel.isFormValid()) {
                  GoRouter.of(context).go('/home')
                } else {
                  print("lock")
                }
              }
            ),
          ],
        ),
      )
    );
  }
}