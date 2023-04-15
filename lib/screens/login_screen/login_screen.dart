import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text: 'Login',
                type: 'headlineLarge',
                color: Theme.of(context).colorScheme.primary,
              ),
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
                type: viewmodel.isFormValid() ? 'enabled' : 'default',
                disabledBackgroundColor: Theme.of(context).colorScheme.secondary,
                enabledBackgroundColor: Theme.of(context).colorScheme.primary,
                disabledTextColor: Colors.grey.shade300,
                title: "Login",
                action: ()=>{
                  if(viewmodel.isFormValid()) {
                    GoRouter.of(context).go('/home')
                  }
                }
              ),
              bottomAction(context)
            ],
          ),
        ),
      )
    );
  }

  Row bottomAction(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
          text: "Don't have an account yet ?",
          color: Theme.of(context).colorScheme.primary,
        ),
        SizedBox(width: MediaQuery.of(context).size.width*.05),
        GestureDetector(
          onTap: () => GoRouter.of(context).go('/signup'),
          child: TextWidget(
            text: "Sign up",
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}