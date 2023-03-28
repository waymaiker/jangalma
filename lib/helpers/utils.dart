String? validateString(String type, String? value, Function? hasError) {
  String? message;
  if(value!.isEmpty){
    type == 'First Name'
      ? message = "First name can't be empty"
      : message = "Last name can't be empty";
  }

  if(hasError != null){
    hasError(true);
  }

  return message;
}

String? validateEmail(String? value, Function? hasError) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
    r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
    r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
    r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
    r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
    r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
    r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  if(value!.isNotEmpty && !regex.hasMatch(value)){
    if(hasError != null){
      hasError(true);
    }
    return 'Enter a valid email address';
  }

  if(hasError != null){
    hasError(true);
  }
  return null;
}

String? validatePassword(String? value, Function? hasError) {
  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  RegExp upperCase = RegExp(r'^(?=.*?[A-Z])');
  RegExp lowerCase = RegExp(r'^(?=.*?[a-z])');
  RegExp numericNumber = RegExp(r'^(?=.*?[0-9])');
  RegExp specialCharacter = RegExp(r'^(?=.*?[!@#\$&*~])');
  String? message;

  if(value!.isNotEmpty){
    message = "Enter valid password:";
    if(!upperCase.hasMatch(value)){
      message = "$message \n * Minimum 1 upper case ";
    }
    if(!lowerCase.hasMatch(value)){
      message = "$message \n * Minimum 1 lower case ";
    }
    if(!numericNumber.hasMatch(value)){
      message = "$message \n * Minimum 1 numeric Number ";
    }
    if(!specialCharacter.hasMatch(value)){
      message = "$message \n * Minimum 1 special character  ( ! @ #  & * ~ )";
    }
    if(value.length <= 8){
      message = "$message \n * Minimum 8 characters";
    }
    if(regex.hasMatch(value)){
      message = null;
    }

    if(hasError != null){
      hasError(true);
    }
    return message;
  }

  if(hasError != null){
    hasError(false);
  }
  return message;
}