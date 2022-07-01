class MailValidator {
  static bool isValidMailAddress(String mailAddress) {
    return RegExp("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")
        .hasMatch(mailAddress);
  }
}
