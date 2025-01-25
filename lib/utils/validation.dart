class FormValidation {


  static String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null ||  value.isEmpty) {
      return 'Please enter password';
    }else if(value.length<6){
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null ||  value.isEmpty) {
      return 'Please enter your first name';
    }
    return null;
  }
  static String? validateLastName(String? value) {
    if (value == null ||  value.isEmpty) {
      return 'Please enter your last name';
    }
    return null;
  }

  static String? validatePhone(String value) {
    if (value.isEmpty) {
      return 'Please enter phone number';
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null ||  value.isEmpty) {
      return 'Please enter username';
    }
    return null;
  }

}