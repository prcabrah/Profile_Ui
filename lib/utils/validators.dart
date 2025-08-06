class Validators {
  static String? validateEmail(String? value) {
    if (value == null || !value.contains('@')) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.length < 8) {
      return 'Password too short';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.length < 10) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your \$fieldName';
    }
    return null;
  }
}


