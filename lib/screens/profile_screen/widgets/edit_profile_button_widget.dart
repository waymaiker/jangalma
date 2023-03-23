import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfileButtonWidget extends StatelessWidget {  
  const EditProfileButtonWidget({  
    required this.edit,
    required this.isEdit,
    required this.save,
  });

  final Function save;
  final Function edit;
  final bool isEdit;  

  @override
  Widget build(BuildContext context) {
    Color color = isEdit ? Colors.white : Colors.blue;
    return GestureDetector(
      onTap: () => isEdit ? save() : edit(),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isEdit ? Colors.blue : Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0)
          ),
          border: Border.all(
            width: 1,
            color: color
          )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              FontAwesomeIcons.pencil, 
              size: 15, 
              color: color
            ),
            SizedBox(width: MediaQuery.of(context).size.width*.01),
            Text(
              isEdit ? 'Save profile' : 'Edit profile',
              style: TextStyle(
                color: color,
                fontSize: 12
              ),
            ),
          ],
        ),
      ),
    );
  }
}