class Signature {
  static Map<String, String> cur = {
    "EUR": "€",
    "USD": "\$",
  };
  static getCurrencySign({String shortName = 'EUR'}) {
    return cur[shortName];
  }
}
