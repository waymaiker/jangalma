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
      viewmodel.firstName, 
      viewmodel.lastName, 
      viewmodel.email, 
      viewmodel.password,
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
                    currentText: viewmodel.firstName,
                    label: "First Name",
                    hintText: "First name",
                    type: 'text',
                    onChanged: viewmodel.setFirstName,
                    isActive: viewmodel.firstName.isNotEmpty,
                  ),
                  TextFieldWidget(
                    currentText: viewmodel.lastName,
                    label: "Last Name",
                    hintText: "Last name",
                    type: 'text',
                    onChanged: viewmodel.setLastName,
                    isActive: viewmodel.lastName.isNotEmpty,
                  ),
                  TextFieldWidget(
                    currentText: viewmodel.email,
                    label: "E-Mail",
                    hintText: "Enter an email",
                    type: 'email',
                    onChanged: viewmodel.setEmail,
                    isActive:  viewmodel.email.isNotEmpty,
                  ),
                  TextFieldWidget(
                    currentText: viewmodel.password,
                    label: "Password",
                    hintText: "Enter your password",
                    type: 'password',
                    onChanged: viewmodel.setPassword,
                    isActive: viewmodel.password.isNotEmpty,
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
                if(viewmodel.isFormValid()) {
                  GoRouter.of(context).go('/home')
                }
              }
            ),
          ],
        ),
      )
    );
  }
}