class MyValidators {
  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter name';
    }
    if (value.length < 3) {
      return 'please enter more then 3 chars';
    }
    if (value.length > 20) {
      return 'please enter less then 20 chars';
    }
    return null;
  }


  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? repeatPasswordValidator({String? value, String? password}) {
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }


  static String? phoneValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a phone number';
    }
    return null;
  }


}
