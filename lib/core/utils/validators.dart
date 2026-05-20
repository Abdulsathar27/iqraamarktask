class Validators {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email is required";
    }

    final emailRegex =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return "Enter valid email";
    }

    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password cannot be empty";
    }

    return null;
  }
}