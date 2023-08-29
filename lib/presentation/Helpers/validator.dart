class Validator {
  static bool validateEmail(String email) {
    const emailRegex =
        r"^[a-zA-Z]{3}\.[0-9]{4}@izam\.co$";
    return RegExp(emailRegex).hasMatch(email);
  }

  static bool validatePassword(String password) {
    const passwordRegex = r"^(?=.*\d)(?=.*[!$#^*]).{8,}$";
    return RegExp(passwordRegex).hasMatch(password);
  }
}
