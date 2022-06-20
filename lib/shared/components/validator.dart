class Validator {
  static String? validateName(String? value) {
    if (value!.isEmpty || value.length < 5) {
      return 'enter_name_ver';
    }
    return null;
  }

  static String? validateEmpty(String? value) {
    if (value!.isEmpty) {
      return "Can't be empty";
    }
    return null;
  }

  static String? validateMobile(String? value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'password_ver';
    } else if (value.length < 6) {
      return 'password_ver';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value!.isEmpty) {
      return 'enterPhoneVer';
    } else if (value.length < 10) {
      return 'enterPhoneVer';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return 'enter_ver';
    } else if (!regExp.hasMatch(value)) {
      return 'enter_ver_invalid';
    } else {
      return null;
    }
  }

  // ignore: body_might_complete_normally_nullable
  static String? validateEmailCorrect(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return null;
    } else {
      if (!regExp.hasMatch(value)) {
        return 'enter_ver_invalid';
      }
    }
  }

  static String? validateAddress(String? value) {
    if (value!.isEmpty || value.length < 5) {
      return 'enter_address_ver'; 
    }
    return null;
  }
}
