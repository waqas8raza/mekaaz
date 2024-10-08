class InputValidator {
  static String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  static String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  static String? validateCNIC(String value) {
    if (value.isEmpty) {
      return 'CNIC is required';
    }

    final RegExp cnicRegExp = RegExp(r'^\d{5}-\d{7}-\d{1}$');

    if (!cnicRegExp.hasMatch(value)) {
      return 'Enter a valid CNIC (format: 12345-6789012-3)';
    }

    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Phone number is required';
    }

    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? confirmPassword(String value, String password) {
    if (value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
