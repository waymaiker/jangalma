import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:jangalma/screens/profile_screen/models/user_model.dart';
import 'package:jangalma/screens/profile_screen/viewmodels/profile_viewmodel.dart';
import 'package:jangalma/screens/profile_screen/widgets/edit_profile_button_widget.dart';
import 'package:jangalma/screens/profile_screen/widgets/profile_item_information_widget.dart';
import 'package:jangalma/widgets/image_widget.dart';
import 'package:jangalma/widgets/override_back_button_wrapper_widget.dart';
import 'package:jangalma/widgets/topbar_widget.dart';

class ProfileScreen extends HookWidget {
  const ProfileScreen();

  @override
  Widget build(BuildContext context) {
    final viewModel = useProvider(profileViewModelProvider);

    useEffect(() {
      viewModel.init(
        UserModel(
          id: 1,
          fullName: "Cassandra Jean",
          pseudoTag: "mytagforthisapp",
          email: "fakeemail@mailchip.com",
          phone: "+33 6 48 65 23 79",
          location: "Paris, FRANCE",
          photoURL: "https://cdn.pixabay.com/photo/2017/02/16/23/10/smile-2072907_1280.jpg"
        )
      );
    }, []);

    useEffect((){}, [viewModel.edit]);

    return OverrideBackButtonWrapperWidget(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopBarWidget(text: "PROFILE", whenClickExitButton: () => viewModel.resetForm()),
              SizedBox(height: MediaQuery.of(context).size.height*.05),
              headerProfile(viewModel, context),
              SizedBox(height: MediaQuery.of(context).size.height*.02),
              ProfileItemInformationWidget(
                editInput: viewModel.edit,
                onChanged:  viewModel.setEmail,
                text: viewModel.user.email,
                icon: FontAwesomeIcons.envelope,
                label: 'Email',
                borderColor: -1,
                backgroundColor: 3,
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.02),
              ProfileItemInformationWidget(
                editInput: viewModel.edit,
                onChanged: viewModel.setPhone,
                text: viewModel.user.phone,
                icon: FontAwesomeIcons.phone,
                label: 'Phone number',
                borderColor: -1,
                backgroundColor: 3,
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.02),
              ProfileItemInformationWidget(
                editInput: viewModel.edit,
                onChanged: viewModel.setPhone,
                text: viewModel.user.location,
                icon: FontAwesomeIcons.locationPin,
                label: 'Location',
                borderColor: -1,
                backgroundColor: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox headerProfile(ProfileViewModel viewModel, BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          ImageWidget(
            src: viewModel.photoURL,
            sizeIcon: 3,
          ),
          profileName(viewModel.user.fullName),
          pseudoTag(viewModel.user.pseudoTag),
          SizedBox(height: MediaQuery.of(context).size.height*.01),
          EditProfileButtonWidget(
            isEdit: viewModel.edit,
            save: () {viewModel.saveProfile(); viewModel.setEdit();},
            edit:  viewModel.setEdit
          )
        ],
      ),
    );
  }

  Padding profileName(String name) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22
        ),
      ),
    );
  }

  Padding pseudoTag(String pseudoTag) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
      child: Text(
        "@$pseudoTag",
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 14
        ),
      ),
    );
  }
}