///
/// This file contains static comparative values,
/// e.g we are supposed to compare currency over signature
///
/// Author: Muhammad Rehan
/// email: mrmuhammadrehan65@gmail.com
///
/// This code is subjected to an assment, you might want to
/// copy this code and modify as your own need, you are free to
/// use this code as your own.
///
class Signature {
  static Map<String, String> cur = {
    "EUR": "€",
    "USD": "\$",
  };
  static getCurrencySign({String shortName = 'EUR'}) {
    return cur[shortName];
  }
}
