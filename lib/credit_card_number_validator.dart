library credit_card_number_validator;

class CreditCardValidator {
  /// Set RegEx For All Cards
  static const String _VISA = "^4[0-9]{12}(?:[0-9]{3})?\$";
  static const String _MASTERCARD =
      "^(?:5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}\$";
  static const String _DISCOVER = "^6(?:011|5[0-9]{2})[0-9]{12}\$";
  static const String _AMEX = "^3[47][0-9]{13}\$";
  static const String _DINERS = "^3(?:0[0-5]|[68][0-9])[0-9]{11}\$";
  static const String _JCB = "^(?:2131|1800|35\d{3})\d{11}\$";

  /// Set Map Key
  static const String cardType = "CardType";
  static const String isValidCard = "IsValidCard";

  /// Add RegEx Cards Into List
  static const List<String> regexList = [
    _VISA,
    _MASTERCARD,
    _DISCOVER,
    _AMEX,
    _DINERS,
    _JCB
  ];

  /// Set Card Types List
  static const List<String> _cardTypesList = [
    "VISA",
    "MASTERCARD",
    "DISCOVER",
    "AMEX",
    "DINERS",
    "JCB"
  ];

  /// Combined RegEx
  static RegExp _regex = new RegExp("^(?:(?<visa>4[0-9]{12}(?:[0-9]{3})?)|" +
      "(?<mastercard>5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}" +
      "(?<discover>6(?:011|5[0-9]{2})[0-9]{12})|" +
      "(?<amex>3[47][0-9]{13})|" +
      "(?<diners>3(?:0[0-5]|[68][0-9])[0-9]{11})|" +
      "(?<jcb>(?:2131|1800|35\d{3})\d{11}))\$");

  // Get Card Data - Card Type and isValid Number as Map
  static Map<String, dynamic> getCard(String cardNumber) {
    String _cardType = _getCardType(cardNumber);
    bool isValid = _isCardValid(_cardType, cardNumber);

    Map<String, dynamic> cardData = new Map();
    cardData.putIfAbsent(cardType, () => _cardType);
    cardData.putIfAbsent(isValidCard, () => isValid);
    return cardData;
  }

  // Get Card Type Based On RegEx
  static String _getCardType(String cardNumber) {
    if (_regex.hasMatch(cardNumber)) {
      for (int i = 0; i < regexList.length; i++) {
        RegExp regExp = new RegExp(regexList[i]);
        if (regExp.hasMatch(cardNumber)) {
          return _cardTypesList[i];
        }
      }
    }
    return "UNKNOWN";
  }

  // Check Card Number Validity - Luhn Algorithm
  static bool _isCardValid(String cardType, String ccNumber) {
    if (cardType == "UNKNOWN" || cardType.trim().length == 0) return false;

    int sum = 0;
    bool alternate = false;
    for (int i = ccNumber.length - 1; i >= 0; i--) {
      int n = int.parse(ccNumber.substring(i, i + 1));
      if (alternate) {
        n *= 2;
        if (n > 9) {
          n = (n % 10) + 1;
        }
      }
      sum += n;
      alternate = !alternate;
    }
    return (sum % 10 == 0);
  }
}
