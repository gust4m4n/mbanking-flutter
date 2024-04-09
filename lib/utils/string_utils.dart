extension StringUtils on String {
  bool containingNumber() {
    return contains(RegExp(r'[0-9]'));
  }

  bool containingAlphabet() {
    return contains(RegExp(r'^[a-zA-Z]'));
  }
}
