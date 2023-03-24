import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jangalma/helpers/utils.dart';
import 'package:jangalma/screens/login_screen/viewmodels/login_viewmodel.dart';
import 'package:jangalma/widgets/button_widget.dart';
import 'package:jangalma/widgets/text_field_widget.dart';
import 'package:jangalma/widgets/text_widget.dart';

class LogInScreen extends HookWidget {
  const LogInScreen();

  @override
  Widget build(BuildContext context) {
    final viewmodel = useProvider(loginViewModelProvider);

    useEffect((){
      viewmodel.init();
    }, []);

    useEffect((){},[viewmodel.email, viewmodel.password]);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextWidget(
            text: 'Login',
            type: 'headlineLarge',
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldWidget(
                  currentText: viewmodel.email,
                  label: "E-Mail",
                  hintText: "Enter an email",
                  type: 'email',
                  onChanged: viewmodel.setEmail,
                  isActive:  viewmodel.email.isNotEmpty,
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.02),
                TextFieldWidget(
                  currentText: viewmodel.password,
                  label: "Password",
                  hintText: "Enter your password",
                  type: 'password',
                  onChanged: viewmodel.setPassword,
                  isActive: viewmodel.password.isNotEmpty,
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.02),
                ButtonWidget(
                  type: viewmodel.email.isNotEmpty && viewmodel.password.isNotEmpty &&
                    validateEmail(viewmodel.email) == null
                    && validatePassword(viewmodel.password) == null
                      ? 'enabled'
                      : 'default',
                  disabledBackgroundColor: Theme.of(context).colorScheme.secondary,
                  enabledBackgroundColor: Theme.of(context).colorScheme.primary,
                  disabledTextColor: Colors.grey.shade300,
                  title: "Login",
                  action: ()=>{
                    if(validateEmail(viewmodel.email) == null && validatePassword(viewmodel.password) == null) {
                      GoRouter.of(context).go('/home')
                    }
                  }
                )
              ],
            ),
          ),
          Column(
            children: [
              TextWidget(
                text: "Don't have an account yet?",
                color: Theme.of(context).colorScheme.primary,
              ),
              TextWidget(
                text: "Sign in",
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          )
        ],
      )
    );
  }
}